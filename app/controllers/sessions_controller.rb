class SessionsController < ApplicationController
	skip_before_filter :user_signed_in

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