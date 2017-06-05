class UsersController < ApplicationController
before_action :user!, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to links_path
      flash[:success] = "You've created an account!"
    else
      redirect_to new_user_path
      flash[:danger] = @user.errors.full_messages.to_sentence
    end
  end

  private

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation)
  end
end
