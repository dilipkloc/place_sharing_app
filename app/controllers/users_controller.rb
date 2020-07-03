class UsersController < ApplicationController
  def index
    @users = User.where('email != ?', current_user.email)
  end

  def show
    @user = User.find_by(username: params[:id])
  end
end