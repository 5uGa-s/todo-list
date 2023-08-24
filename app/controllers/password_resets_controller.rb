class PasswordResetsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user
      user.generate_reset_token
      user.save

      UserMailer.reset_password_email(user).deliver_now

      flash[:notice] = "パスワードのリセット手順があなたの電子メールに送信されました。"
      redirect_to root_path
    else
      flash.now[:alert] = "このメールではユーザーが見つかりませんでした。"
      render :new
    end
  end

  def edit

  end

  def update

  end

end
