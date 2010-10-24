class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate, :except => [:login, :signup, :register, :activate]

  def load_user
    @user = User.find(params[:user_id]) #Group.find(session[:user].group.id)
  end

  def authenticate
    unless user=User.find_by_id(session[:user_id])
      flash[:notice] = "Please log in"
    end
    session[:user] = user
    session[:ip] = request.remote_ip
  end
end
