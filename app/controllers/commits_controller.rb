class CommitsController < ApplicationController
  def index
    @commits = Commit
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
