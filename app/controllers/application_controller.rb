class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?

  def logged_in?
    @logged_in ||= session[:session_token].try(:digest) == SessionsController::SECRET_HASH
  end

  def redirect_if_unauthorized!
    redirect_to root_url if !logged_in?
  end

end
