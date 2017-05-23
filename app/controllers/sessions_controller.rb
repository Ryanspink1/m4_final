class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
        redirect_to '/links'
        flash[:success] = "Successfully logged in, welcome back"
    else
      flash[:danger] = 'Invalid Credentials'
      render :new
    end
  end

  def destroy
    session.clear
    flash[:success] = "You've logged out.  Come back soon!"
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
