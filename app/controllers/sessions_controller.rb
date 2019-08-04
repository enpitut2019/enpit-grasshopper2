class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && User.find_by(password_digest: params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      redirect_to("/profile/show")
      flash.now[:notice] = 'In'
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'Invalid email / Password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
