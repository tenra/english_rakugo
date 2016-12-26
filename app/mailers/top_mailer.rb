class TopMailer < ActionMailer::Base
  default from: "11tenra@gmail.com"   # 送信元アドレス

  def received_email(top)
    @top = top
    mail(to: @top.email, :subject => 'お問い合わせを承りました')
  end
 
end