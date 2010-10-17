class ApplicationController < ActionController::Base
  protect_from_forgery

  def load_user
    @user = User.find(params[:user_id]) #Group.find(session[:user].group.id)
  end
end
