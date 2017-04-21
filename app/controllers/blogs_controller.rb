class BlogsController < ApplicationController
    before_action :organizer_check, except: [:show]
    
  def show
    @blog = Blog.find(params[:id])
    @user = User.find(params[:id])
    @user = @blog.user
  end
    
  def new
    @blog = Blog.new
  end

  def create
    @user = current_user
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "Successfully created new Blog!"
      redirect_to postblog_path
    else
      render 'new'
    end
  end
    
  def edit
    @blog = Blog.find(params[:id])
    @blog.photo.cache! if @blog.photo.present? && Rails.env.development?
  end
  
  def update
    @blog = Blog.find(params[:id])
    @blog.assign_attributes(blog_params)
    if params[:back]
      render :edit
    elsif @blog.update(blog_params)
       flash[:success] = "Update completed!"
       redirect_to postblog_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = 'Your blog has been successfully cancelled.'
    redirect_to postblog_path
  end

  private
  def blog_params
    params.require(:blog).permit(
    :title, :text, :photo, :photo_cache)
  end
    
end
