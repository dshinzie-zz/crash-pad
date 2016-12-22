class VerifyController < ApplicationController

  def verify
    token = AuthyUser.get_verified_user(current_user, params[:token])
    if token.ok?
      AuthyUser.update_verified_user(current_user)
      redirect_to show_user_path(current_user)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    AuthyUser.get_requested_sms(current_user)
    flash[:notice] = "Verification code re-sent"
    redirect_to verify_path
  end

  def show_verify
    return redirect_to new_user_path unless session[:user_id]
  end

end
