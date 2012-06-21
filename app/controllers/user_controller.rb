class UserController < ApplicationController
  
  require 'csv'
  
  include ApplicationHelper

  before_filter :check, :except=>[:registration, :blog, :logout, :contact_us, :login, :about_project]

  def index
  end

  def registration
    if request.post? and params[:user]
      #logger.info params[:user].inspect
      #raise params[:user].inspect
      @user = User.new(params[:user])
      if @user.save
        session[:user_idd]=@user.id
        flash[:notice] = "User #{@user.user_id} created"
        redirect_to :action => 'index'
      end
    end
  end
  
  def login
    if request.get?
    @user = User.new(:remember_me => cookies[:remember_me] || "0")
    elsif request.post? and params[:userform]
      #logger.info params[:user].inspect
      #raise params[:user].inspect
      @user = User.new(params[:userform])
      user = User.find(:first,:conditions => ["user_id = ? and password = ?",@user.user_id, @user.password])
      if user and @user.remember_me == "1"
        cookies[:remember_me] = { :value => "1",
                                              :expires => 10.years.from_now }
        
        #user.remember_token = user.id
        #user.save!
        #cookies[:remember_token] = {
          #         :value => user.remember_token,
            #       :expires => 10.years.from_now }                                      
        
        session[:user_idd] = user.email
        flash[:notice] = "User #{user.user_id} logged in!"
        
        if (redirect_url = session[:protected_page])
          session[:protected_page] = nil
          redirect_to redirect_url
        else
          @user.password = nil
          redirect_to :controller=>'start', :action => 'index'
        end
        
        
      else
        # Don't show the password in the view.
        @user.password = nil
        #cookies.delete(:remember_me)
        #cookies.delete(:remember_token)
        flash[:notice] = "Invalid User Id/password combination"
        redirect_to :controller=>'start', :action => 'index'
      end
    end
    #flash[:notice] = "not data passed"
    #redirect_to :action => "index"
  end
  
  def logout
    session[:user_idd] = nil
    flash[:notice] = "Logged out"
    redirect_to :action => "index", :controller => "start"
  end
  
  def image
  end
  
  def vedio
  end
  
  def blog
    #raise request.request_uri.inspect
  end
  
  def check
    unless logged_in?
      session[:protected_page] = request.request_uri
      flash[:notice] = "Please log in first"
      redirect_to :action => "index", :controller=>'start'
      return false
    end
  end

  def csv_index
  end
  
  def csv_import 
     @parsed_file=CSV::Reader.parse(params[:dump][:file])
     n=0
     @parsed_file.each  do |row|
     c=CustomerInformation.new
     c.name=row[0]
     c.charge=row[1]
     if c.save
        n=n+1
        GC.start if n%50==0
     end
     flash.now[:message]="CSV Import Successful,  #{n} new records added to data base"
   end
 end
 
 def profile
   @users=User.paginate :page=>params[:page], :order=>'updated_at', :per_page=>'1'
 end

def vote
    @user=User.find(params[:id])
    #raise @user.inspect
    @user.count=@user.count+=1;
    #raise @user.count.inspect
    @user.save
    #@users=User.all
      #render 'index'
       #@story.update_attributes(params[:story])
       #render 'index'
       render :update do |page|
          page.replace_html 'vote_score', :partial => 'change', :object => @user, :layout => false
      end
       
     end
     
def about_project
end
     
def download 
    send_file "#{RAILS_ROOT}/public/data/#{params[:file_name]}", :type=>"application/zip" 
end 

end
