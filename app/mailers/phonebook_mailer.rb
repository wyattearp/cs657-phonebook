class PhonebookMailer < ActionMailer::Base
  default :from => "from@example.com"

  def sendphonebook(user,phonebook)
    @user = user;
    @phonebook = phonebook;
    mail(:to => user.email, :subject => "You have been sent an address book!")
  end
end