class BookingsController < ApplicationController
  before_action :store_booking_people, only: [:create]
  before_action :sign_in_required
  
  def create
      #binding.pry
      @event = Event.find(params[:event_id])
    ActiveRecord::Base.transaction do
      if @event.capacity <= @event.booking_users.count
        flash[:alert] = "Sorry, It is fullbooking now."
        redirect_to show_event_path
      else
        @user = current_user
        @booking = current_user.booking(@event)
        @booking.people = params[:booking][:people]
        @booking.number = @event.created_at.strftime('%Y%m%d%H%M').to_s + @event.id.to_s + @user.id.to_s
        @booking.save
        #flash[:notice] = "your booking is completed!"
        #EventMailer.received_email(@event, current_user).deliver_now
        redirect_to charge_event_path(@event)
      end
    end
  end
  
  def pay
    @user = current_user
    @event = Event.find_by(params[:id])
    @booking = current_user.booking(@event)
    Payjp.api_key = 'sk_test_529baaaf684e0a59892924d9'
    charge = Payjp::Charge.create(
      :amount => @booking.people * @event.price,
      :currency => 'jpy',
      #:customer => @user.customer,
      :card => params['payjp-token'],
      :description => 'test english_rakugo'
    )
    #self.update({pay_charge_id: charge['id']})
  end

  def destroy
     @event = Event.find(params[:event_id])
    if current_user.admin == true
      @user = User.find(params[:user_id])
      @user.unbooking(@event)
      flash[:notice] = "Successfully unbooked!"
      redirect_to admin_participants_path(@event)
    else
      current_user.unbooking(@event)
      flash[:notice] = "Your event has been successfully cancelled!"
      redirect_to users_me_path
    end
  end
  
  private
    def booking_params
      params.require(:booking).permit(:people)
    end
    
  def store_booking_people
    if !user_signed_in? && params[:booking] && params[:booking][:people]#ここは params[:booking] のnilチェックが必要かも
      session[:booking_people] = params[:booking][:people]
    end
  end
end