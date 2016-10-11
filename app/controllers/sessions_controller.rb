class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash[:success] = "ログインしました"
        redirect_to user
      else
        message = "メールアドレスの確認が取れていません"
        message += "登録時に送信されたメールから認証を済ませてください"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash[:danger] = "メールアドレスとパスワードの組み合わせが正しくありません"
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
