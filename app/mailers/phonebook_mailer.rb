class PhonebookMailer < ActionMailer::Base
  default :from => "from@example.com"

  def sendphonebook(user,phonebook,email={})
    @user = user;
    @phonebook = phonebook;
    @message = email[:message];
    mail(:to => email[:to], :subject => email[:subject])
  end
end