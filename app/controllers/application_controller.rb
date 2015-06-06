class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :add_books?, :add_book

  def current_user 
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def add_books?
    if @add_panel==true
      "addbook"
    else "sbook"
    end
  end
  def require_user 
  	redirect_to '/login' unless current_user
  end
  def add_book
    
  end
end
