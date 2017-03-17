class TopMailer < ActionMailer::Base
  default from: "11tenra@gmail.com"
  default to: "amigojpn5115@god.zaq.jp"
  
  def received_email(top)
    @top = top
    mail(:subject => 'English Rakugo Contact Us')
  end
 
end