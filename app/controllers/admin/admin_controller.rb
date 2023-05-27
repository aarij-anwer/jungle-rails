# app/controllers/admin/admin_controller.rb
class Admin::AdminController < ApplicationController
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.configuration.admin_username && password == Rails.configuration.admin_password
    end
  end
end
