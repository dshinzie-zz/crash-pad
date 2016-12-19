class ResetPasswordController < ApplicationController

  def edit
    @user = User.find(params[:user_id])
    @user.verified = false
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update(user_params)
      session[:user_id] = @user.id
      authy_user = AuthyUser.get_registered_user(@user)
      AuthyUser.get_requested_sms(authy_user)
      redirect_to verify_path
    else
      redirect_to new_user_path
    end
  end

  def verify
    token = AuthyUser.get_verified_user(current_user, params[:token])
    if token.ok?
      AuthyUser.update_verified_user(current_user)
      redirect_to user_path(current_user)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  private

  def user_params
    params.require(:user).permit(:password)
  end

end
