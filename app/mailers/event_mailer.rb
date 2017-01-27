class EventMailer < ActionMailer::Base
  default from: "11tenra@gmail.com"
  
  def received_email(event, current_user)
    @event = event
    @user = current_user
    @booking = current_user.booking(@event)
    @booking.number = @event.created_at.strftime('%Y%m%d%H%M').to_s + @event.id.to_s + @user.id.to_s
    
    mail to: current_user.email, subject: 'Thanks to booking our event!!'
  end
 
end