class SessionsController < ApplicationController
	skip_before_filter :verify_logged_in
	skip_before_filter :verify_authenticity_token unless Rails.env.production?
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
  	redirect_to '/auth/facebook'
	end
end