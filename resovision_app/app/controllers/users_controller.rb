class UsersController < ApplicationController
  before_action :authorize, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:linkedin_email, :linkedin_pw)
  end

end
