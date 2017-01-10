class TimetablesController < ApplicationController
  def index
    @timetable = Timetable.new(event_id: params[:event_id])
    @timetables = Timetable.all
  end
end
