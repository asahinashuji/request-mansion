class AcountActivationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in(user)
      flash[:succes] = "メールアドレスを確認致しました"
      redirect_to user
    else
      flash[:danger] = "メールアドレスの認証に失敗しました"
      redirect_to root_url
    end
  end
end
