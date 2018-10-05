class ApplicationController < ActionController::Base
  def user_dashboard_path
    if current_user.admin?
      admin_dashboard_path
    else
      dashboard_path
    end
  end

  def current_user
    @current_user ||= User.find(session["id"]) if session["id"]
  end
end
