class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone,
        country_code: "1"
        )
      @user.update(authy_id: authy.id)
      Authy::API.request_sms(id: @user.authy_id)
      redirect_to verify_path
    else
      redirect_to new_user_path
    end
  end

  def show_verify
    return redirect_to new_user_path unless session[:user_id]
  end

  def show
    @user = current_user
  end

  def verify
    @user = current_user
    token = Authy::API.verify(id: @user.authy_id, token: params[:token])
    if token.ok?
      @user.update(verified: true)
      send_message("You did it! Signup complete :)")
      redirect_to user_path(@user)
    else
      flash.now[:danger] = "Incorrect code, please try again"
      render :show_verify
    end
  end

  def resend
    @user = current_user
    Authy::API.request_sms(id: @user.authy_id)
    flash[:notice] = "Verification code re-sent"
    redirect_to verify_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Account successfully updated!"
      redirect_to dashboard_path
    else
      # flash[:warning] = "Not valid information"
      redirect_to edit_user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :first_name, :last_name, :phone)
  end

  def send_message(message)
    @user = current_user
    twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    message = @client.messages.create(
          from: twilio_number,
          to: "+1#{@user.phone}",
          body: message
          )
  end

end
