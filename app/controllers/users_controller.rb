class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :mine_user, only: [:edit, :update, :destroy]
  before_action :wing_user, only: [:wing, :show]
  
  def top
  end
 
  def index
    @users = User.where(open: true, activated: true).paginate(page: params[:page], per_page: 20).order(created_at: :DESC)
  end
  
  def wing
    @users = User.paginate(page: params[:page], per_page:20)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    if logged_in? && !admin_user?
      redirect_to root_url
      flash[:danger] = "既にユーザー登録されています"
    end
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      @user.open == '1' ? 'true' : 'false'
      @user.update_attributes(open: @user.open)
      @user.send_activation_email
      flash[:info] = "ご登録頂いたアドレスにメールを送りましたので認証を行ってください"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:succes] = "更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    @user.delete
    redirect_to root_url
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :tel, :budger, :station, :walk, :area, :year_built, :elevator, :floor, :pet, :season, :open, :other)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def mine_user
      unless current_user == set_user || admin_user?
       redirect_to root_url
       flash[:danger] = "要求されたページへのアクセス権限がありません"
      end
    end
    
    def wing_user
      unless current_user.wing? || admin_user? || current_user == set_user
        redirect_to root_url
        flash[:danger] = "要求されたページへのアクセス権限がありません"
      end
    end  
end
