class EventsController < ApplicationController
    before_action :sign_in_required, only: [:edit, :update]

  
  def show
      @event = Event.find(params[:id])
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    @event.assign_attributes(event_params)
    if @event.save
      flash[:success] = "update completed!"
      redirect_to @event
    else
      render 'edit'
    end
  end
  
private
    def event_params
      params.require(:event).permit(
      :title, :text
        )
    end
  
end
