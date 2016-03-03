class Commit < ActiveRecord::Base
  extend Truncatable
  belongs_to :user

  scope :for_user, ->(email) { joins(:user).merge(User.by_email(email)) }

end
