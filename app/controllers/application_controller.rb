class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :authenticate, :except => [:root, :login, :load_user, :authenticate, '/signup', '/register', '/login', '/logout', '/activate']

  def load_user
    unless @user = User.find(session[:user_id])
      flash[:notice] = "Please log in"
    end
  end

  def authenticate
    unless user=User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
      redirect_to '/login'
    end
    session[:user] = user
    session[:ip] = request.remote_ip
  end
end
