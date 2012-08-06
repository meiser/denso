class ApplicationController < ActionController::Base
  protect_from_forgery


  before_filter :authenticate_user!

  helper_method :current_user



  def start

  end

  private

  def current_user
   @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authenticate_user!
    unless session[:user_id]
     flash[:notice] = "Erst anmelden"
     session[:return_to] = request.path
     redirect_to :controller => "sessions", :action => "new"
    end
  end


end

