class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])
    attrs = {}
    attrs[params[:name]] = params[:value]
    @user.update_attributes(attrs)
  end
end
