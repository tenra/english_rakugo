class TimetablesController < ApplicationController
   #before_action :admin_check
   before_action :organizer_check
  
  def index
    @timetable = Timetable.new(event_id: params[:event_id]) 
    @timetables = Timetable.where(event_id: params[:event_id])
    @event = Event.find(params[:event_id])
  end
  
  def create
    @timetable = Timetable.new(timetable_params)
    @timetable[:event_id] = params[:event_id]
    if @timetable.save
       redirect_to timetables_path(event_id: params[:event_id])
    else
      @timetables = Timetable.where(event_id: params[:event_id])
      flash.now[:alert] = "Your column is not created yet."
      render 'index'
    end
  end
  
  def edit
    @timetable = Timetable.find(params[:id])
  end

  def update
      @timetable = Timetable.find(params[:id])
      @timetable.assign_attributes(timetable_params)
    if @timetable.update(timetable_params)
      redirect_to timetables_path(event_id: params[:event_id])
    else
      render 'edit'
    end
  end
  
  def destroy
    @timetable = Timetable.find(params[:id])
    @timetable.destroy
    redirect_to timetables_path(event_id: @timetable.event_id)
  end
  
  private
  def timetable_params
    params.require(:timetable).permit(:time, :description)
  end

end
