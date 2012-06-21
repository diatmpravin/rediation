class EmailerController < ApplicationController

 include ApplicationHelper 

 before_filter :check

def index
  
end

def sendmail
      recipient = params[:email]
      subject = params[:subject]
      message = params[:message]
      Emailer.deliver_contact(recipient, subject, message)
      return if request.xhr?
      flash[:notice] = "Message sent successfully"
      render :action => 'send'
      
end
    
    def check
    unless logged_in?
      session[:protected_page] = request.request_uri
      flash[:notice] = "Please log in first"
      redirect_to :action => "index", :controller=>'start'
      return false
    end
  end

end
