class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:linkedin_id])
    if @user && @user.authenticate(params[:linkedin_pw])
      session[:current_user] = @user.linkedin_id
      redirect_to root_path
    else
      @error = "Wrong username or password."
      render :new
    end
  end

  def destroy
    session[:current_user] = nil
    redirect_to login_path
  end
end
