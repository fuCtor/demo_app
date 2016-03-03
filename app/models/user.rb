# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string           indexed
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#

class User < ActiveRecord::Base
  extend Truncatable

  scope :by_email, ->(email) { where("email LIKE ?", email) }
end
