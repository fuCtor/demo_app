# == Schema Information
#
# Table name: commits
#
#  id          :integer          not null, primary key
#  commited_at :datetime
#  user_id     :integer          indexed
#  sha         :string
#  message     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_commits_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_409a66d7e3  (user_id => users.id)
#

class CommitsController < ApplicationController
  def index
    @commits = Commit.includes(:user)
    if params[:email]
      @commits = @commits.for_user params[:email]
    end
    @commits = @commits.page(params[:page])
  end

  def create
    if ImportService.run(import_params[:user], import_params[:repo]).present?
      redirect_to({ action: :index }, notice: 'Imported'  )
    else
      redirect_to({ action: :index }, alert: 'Import error' )
    end

  end

  private
  def import_params
    @import_params ||= params.require(:import).permit(:user, :repo)
  end
end
