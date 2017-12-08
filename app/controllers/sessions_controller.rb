class SessionsController < ApplicationController

  SECRET_HASH = "fe3ce3b08bb4ebf40492e034a5089064f2cf49707af8c45f6c0f543b70301c4a"

  def login
    if params[:password].digest.digest == SessionsController::SECRET_HASH
      session[:session_token] = params[:password].digest
      redirect_to root_path
    else
      @invalid_login = true
      render "static/login"
    end
  end

  def logout
    session[:session_token] = nil
    redirect_to root_path
  end

end
