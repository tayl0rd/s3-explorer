class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    # redirect_to new_session_path unless signed_in?
  end

  def signed_in?

  end
end
