class HomeController < ApplicationController
  before_filter :move_to_app_if_user

  def index; end

  private

  def move_to_app_if_user
    if current_user.present?
      redirect_to app_path
    end
  end
end
