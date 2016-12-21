class Admin::BaseController < ApplicationController
  before_action :require_admin
  helper_method :user_status


  def require_admin
    render plain: 'Not Found', status: '404' unless is_admin?
  end

  def user_status(user_id)
    User.unscoped.find(user_id).status
  end

end
