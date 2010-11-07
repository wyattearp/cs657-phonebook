class PhonebookMailer < ActionMailer::Base

  def sendphonebook(user,phonebook,email={})
    @user = user
    @phonebook = phonebook
    @message = email[:message]

    # store the phonebook in Comma Seperated Values
    csv_addresses = FasterCSV.generate do |csv|
      # create the header
      csv << ["name", "phone", "address1", "address2", "city", "state", "zip"]

      # output a row of phonebook data
      @phonebook.entries.each do |entry|
        csv << ["\"#{entry.name}\"", "\"#{entry.phone}\"", "\"#{entry.address1}\"", "\"#{entry.address2}\"", "\"#{entry.city}\"", "\"#{entry.state}\"", "\"#{entry.zip}\""]
      end
    end

    # Create a CSV file named after the phonebook
    #TODO: doesn't do error correction on filenames
    filename = @phonebook.name + ".csv"
    csv_file = File.new(filename, "w")
    csv_file.puts(csv_addresses)

    # Create and send the email using the to and subject fields and attaching the requested file
    mail(:from => @user.email, :to => email[:to], :subject => email[:subject], :attachment => filename)

    # delete the file so we don't leave stale files and personal data on the computer
    File.delete(filename)
  end
end