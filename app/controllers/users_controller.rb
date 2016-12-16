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
        cellphone: @user.phone
        )
      @user.update(authy_id: authy.id)
      redirect_to dashboard_path
    else
      redirect_to new_user_path
    end
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

end
