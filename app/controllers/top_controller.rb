class TopController < ApplicationController
  #layout "top_layout"
  
  def home
    @events = Event.all
    render :home, layout: "top_layout"
  end
  
  def about
    @top = Top.new
  end
  
  def confirm
    @top = Top.new(top_params)
    if @top.valid?
      render :action => 'confirm'
    else
      render :action => 'about'
    end
  end
  
  def thanks
    @top = Top.new(top_params)
    TopMailer.received_email(@top).deliver
    render :action => 'thanks'
  end
  
  def terms_of_service
  end
  
  private
  def top_params
    params.require(:top).permit(:name, :email, :message)
  end
  
end
