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

class Commit < ActiveRecord::Base
  extend Truncatable
  belongs_to :user

  scope :for_user, ->(email) { joins(:user).merge(User.by_email(email)) }

end
