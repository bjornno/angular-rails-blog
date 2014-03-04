class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_filter :verify_logged_in

	helper_method :current_user
  helper_method :user_signed_in?

  private
  def verify_logged_in
    unless Rails.env == 'test'
    	render(:file => "public/401", :status => :unauthorized, :layout => false) unless user_signed_in?
    end	
  end
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def user_signed_in?
    return true if current_user
  end
end
