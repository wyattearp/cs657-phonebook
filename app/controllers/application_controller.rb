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

  def secure_user_permissions

    unless params[:user_id].nil?
      unless (session[:user] == User.find_by_id(params[:user_id]))
        flash[:notice] = "You don't have permssion to that resource"
        redirect_to user_phonebooks_path(session[:user])
      end
    end
    unless params[:phonebook_id].nil?
      unless (session[:user]) == Phonebook.find_by_id(params[:phonebook_id]).user
        flash[:notice] = "You don't have permssion to that resource"
        redirect_to user_phonebooks_path(session[:user])
      end
    end
  end
end
