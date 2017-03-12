class EventsController < ApplicationController
    before_action :sign_in_required, only: [:edit, :update, :destroy]
    before_action :admin_check, only: [:new, :create, :edit, :update, :destroy]
  
  def show
    @events = Event.where(id: Event.find(params[:event_id]))
    @event = Event.find(params[:event_id])
    @timetable = Timetable.find_by(event_id: params[:event_id])
    @timetables = Timetable.where(event_id: params[:event_id])
    
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
     marker.lat event.latitude
     marker.lng event.longitude
     marker.infowindow event.description
     marker.json({name: event.name})
    end
  end
  
  def ticket
    @event = Event.find(params[:id])
    if session[:booking_people]
      @booking_people = session[:booking_people].to_i
      session[:booking_people] = nil
    end
  end
  
  def new
    @event = Event.new
  end
  
  def confirm
    @event = Event.new(event_params)
    render :new if @event.invalid?
  end
  
  def create
    @event = Event.new(event_params)
    if params[:back]
      render :new
    elsif @event.save
       flash[:success] = "Create Event!"
       redirect_to show_event_path(@event)
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
    @event.image.cache! if @event.image.present? && Rails.env.development?
  end

  def confirm2
    @event = Event.find(params[:id])
    @event.assign_attributes(event_params)
    render :edit if @event.invalid?
    #binding.pry
  end
  
  def update
    @event = Event.find(params[:id])
    @event.assign_attributes(event_params)
    if params[:back]
      render :edit
    elsif @event.update(event_params)
       flash[:success] = "update completed!"
       redirect_to show_event_path(@event)
    else
      render 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = 'Your event has been successfully cancelled.'
    redirect_to admin_events_url
  end

private
    def event_params
      params.require(:event).permit(
      :title, :text, :image, :image_cache, :image2, :image2_cache, :name, :description, :latitude, :longitude, :address,
      :date, :time, :end_date, :end_time, :price, :capacity)
    end
end