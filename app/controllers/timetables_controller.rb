class TimetablesController < ApplicationController
  def index
    @timetable = Timetable.new(event_id: params[:event_id]) 
    @timetables = Timetable.where(event_id: params[:event_id])
  end
  
  def create
    @timetable = Timetable.new(timetable_params)
    @timetable[:event_id] = params[:event_id]
    if @timetable.save
       redirect_to timetables_path(event_id: params[:event_id])
    else
      @timetables = Timetable.where(event_id: params[:event_id])
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  def edit
    
  end

  def update
    if @timetable.update(timetable_params)
      redirect_to root_path, notice: 'edited your column'
    else
      render 'edit'
    end
  end
  
  def destroy
    @timetable = Timetable.find(params[:id])
    @timetable.destroy
    redirect_to timetables_path
  end
  
  private
  def timetable_params
    params.require(:timetable).permit(:time, :description)
  end

end
