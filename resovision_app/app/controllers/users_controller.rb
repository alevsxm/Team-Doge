class UsersController < ApplicationController
  before_action :authorize, only: [:edit, :update, :destroy]

  # def index
  #   @users = User.all
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sessions[:current_user]

  def show
    @user = User.find(params[:id])
  end



  private
  def user_params
    params.require(:user).permit(:linkedin_email, :linkedin_pw)
  end

end
