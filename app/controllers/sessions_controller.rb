class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      admin_redirect
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

    def admin_redirect
      if current_user.admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path(user: current_user.slug)
      end
    end

end
