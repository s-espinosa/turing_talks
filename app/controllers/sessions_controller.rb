class SessionsController < ApplicationController
  def new
  end

  def create
    census_user = request.env["omniauth.auth"]
    @user = CensusUser.find(census_user)
    session["id"] = @user.id
    redirect_to user_dashboard_path
  end
end
