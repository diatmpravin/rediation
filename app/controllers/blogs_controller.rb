class BlogsController < ApplicationController

  include ApplicationHelper
  
  before_filter :check, :except=>[:view, :show_recent]

# GET /blogs
  # GET /blogs.xml
  def index
    @blogs=Blog.paginate :page=>params[:page], :order=>'updated_at', :per_page=>'1'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.xml
  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id=session[:user_idd]
    #raise params[:blog].inspect
    #raise @blog.user_id.inspect
    respond_to do |format|
      if @blog.save
        format.html { redirect_to(@blog, :notice => 'Blog was successfully created.') }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end
  
  def check
    unless logged_in?
      session[:protected_page] = request.request_uri
      flash[:notice] = "Please log in first"
      redirect_to :action => "index", :controller=>'start'
      return false
    end
  end
  
  def view
    @blogs=Blog.paginate :page=>params[:page], :order=>'updated_at', :per_page=>'2'
  end
  
  def show_recent
    @comment = Comment.new 
    @blog = Blog.find(params[:id])
    @comments = Comment.find(:all, :conditions => [ 'blog_id=?', params[:id] ])
    #raise @comments.inspect
  end

 # def post_comment
   # @comment = Comment.new(:name=>params[:name], :body=>params[:body])
    #raise @comment.inspect
  #end
  
end
