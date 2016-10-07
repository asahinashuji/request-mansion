class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.open == '1' ? 'true' : 'false'
      @user.update_attributes(open: @user.open)
      flash[:succses] = "新規登録しました"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :tel, :budger, :station, :walk, :area, :year_built, :elevator, :floor, :pet, :season, :open, :other)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
end
