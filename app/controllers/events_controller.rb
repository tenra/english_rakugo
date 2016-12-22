class EventsController < ApplicationController
    before_action :sign_in_required, only: [:edit, :update, :destroy]
    before_action :admin_check, only: [:new, :create, :edit, :update, :destroy]

  
  def show
    @events = Event.all
    @event = Event.find(params[:id])
    
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
     marker.lat event.latitude
     marker.lng event.longitude
     marker.infowindow event.name
    end
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
       flash[:success] = "Create Event!"
       redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
       flash[:success] = "update completed!"
       redirect_to @event
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = 'Your event has been successfully cancelled.'
    redirect_to root_path
  end
  
private
    def event_params
      params.require(:event).permit(
      :title, :text, :image, :image_cache, :name, :description, :latitude, :longitude)
    end

end
