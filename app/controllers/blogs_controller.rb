class BlogsController < ApplicationController
    before_action :organizer_check
    
  def new
    @blog = Blog.new
  end

  def create
    @user = current_user
    @blog = current_user.events.build(blog_params)
    if params[:back]
      render :new
    elsif @blog.save
    #binding.pry
       flash[:success] = "Created new Blog!"
       redirect_to blogs_path(@blog)
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
       redirect_to blogs_path(@blog)
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:success] = 'Your blog has been successfully cancelled.'
    redirect_to blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(
      :title, :text, :photo, :photo_cache)
    end
    
end
