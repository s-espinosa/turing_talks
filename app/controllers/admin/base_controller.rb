class Admin::BaseController < ApplicationController
  before_action :check_current_admin

  def check_current_admin
    unless current_admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
