class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_last_seen_at, if: :user_signed_in?
  
  add_flash_types :success
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  def set_last_seen_at
    current_user.touch(:last_seem_at)
  end
end
