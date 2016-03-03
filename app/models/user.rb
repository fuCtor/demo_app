class User < ActiveRecord::Base
  extend Truncatable

  scope :by_email, ->(email) { where("email LIKE ?", email) }
end
