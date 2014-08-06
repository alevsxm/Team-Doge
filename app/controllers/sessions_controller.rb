class SessionsController < ApplicationController

  def new
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path
  end
end
