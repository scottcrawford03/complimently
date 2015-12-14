class SessionsController < ApplicationController
  def create
    user = User.find_by(username: permitted_params[:username])
    if user && user.authenticate(permitted_params[:password])
      session[:user_id] = user.id
      redirect_to user_compliments_path
    else
      redirect_to root_url
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end

  private

  def permitted_params
    params.require(:login).permit(:username, :password)
  end
end
