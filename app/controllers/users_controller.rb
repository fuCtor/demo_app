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

class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    attrs = {}
    attrs[params[:name]] = params[:value]
    @user.update_attributes(attrs)
  end
end
