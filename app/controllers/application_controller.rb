class ApplicationController < ActionController::Base
  helper_method :current_user

  def user_dashboard_path
    return root_path unless current_user
    if current_user.admin?
      admin_dashboard_path
    else
      dashboard_path
    end
  end

  def current_user
    @current_user ||= User.find(session["id"]) if session["id"]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
