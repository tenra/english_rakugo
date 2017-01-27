class EventMailer < ActionMailer::Base
  default from: "11tenra@gmail.com"
  default to: "11tenchi@ezweb.ne.jp"
  
  def received_email(event)
    @event = event
    mail(:subject => 'Thanks to booking our event!!')
  end
 
end