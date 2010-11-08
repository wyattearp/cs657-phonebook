class UserObserver < ActiveRecord::Observer

  # after the user is created, send the signup_notification email
  def after_create(user)
    UserMailer.signup_notification(user).deliver
  end

  # after the user has been successfully saved to the database, send the activation email
  def after_save(user)
    UserMailer.activation(user).deliver if user.recently_activated?
  end

end
