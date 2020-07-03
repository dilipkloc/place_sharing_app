class UsersController < ApplicationController
  def index
    @users = User.where('email != ?', current_user.email)
  end

  def show
    binding.pry
  end
end