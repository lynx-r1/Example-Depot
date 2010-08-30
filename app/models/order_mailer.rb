class OrderMailer < ActionMailer::Base
  
  def confirm(order, sent_at = Time.now)
    subject    "Test mail"
    recipients order.email
    from       'alex-86p@yandex.ru'
    sent_on    sent_at
    
    body       :order => order
  end

end
