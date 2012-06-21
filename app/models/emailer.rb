class Emailer < ActionMailer::Base
  
def contact(recipient, subject, message, sent_at = Time.now)
      @subject = subject
      @recipients = recipient
      @from = "<diatm.pravin.it.07.27@gmail.com>"
      @sent_on = sent_at
          #@body["title"] = 'This is title'
          #@body["email"] = 'sender@yourdomain.com'
          @body["message"] = message
      @headers = {}
   end

end
