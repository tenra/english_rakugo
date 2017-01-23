class TopController < ApplicationController
  def home
    @events = Event.all
  end
  
  def about
    @top = Top.new
    render :action => 'about'
    @tops = Top.all
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
  
  private
  def top_params
    params.require(:top).permit(:name, :email, :message)
  end
  
end
