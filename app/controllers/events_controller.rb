class EventsController < ApplicationController
  def show
      @event = Event.find(params[:id])

  end
  
private
    def event_params
      params.require(:event).permit(
      :title, :text
        )
    end
  
end
