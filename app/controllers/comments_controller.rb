class CommentsController < ApplicationController
  
  def create
      @comment=Comment.new(params[:comment])
      @comment.blog_id=params[:blog_id]
      @comment.save
      #raise @comment.inspect

      #@commentt=Comment.new
      #@commentt.blog_id=Comment.find(params[:blog_id])
      #@comment.blog_id.save
      #raise @commentt.blog_id.inspect

      #params[:blog_id]
      #params[:comments][:blog_id]
      #@cs = params[:comments][:blog_id] #take parameter from URL
      #@comment.blog_id=@cs
      #raise @comment.blog_id.inspect  
      
      redirect_to :controller=>'blogs', :action=>'view'
      
      #render :update do |page|
        #  page.replace_html 'comment_by_public', :partial => 'comment_public', :object => @comment, :layout => false
      #end
  end

end
