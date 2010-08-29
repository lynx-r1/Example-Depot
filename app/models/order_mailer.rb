class OrderMailer < ActionMailer::Base
  

  def confirm(order, sent_at = Time.now)
    subject    I18n.t('order_mailer.models.subject')
#    recipients order.email
    from       'orders@lynx-r.homelinux.net'
    sent_on    sent_at
    
#    body       :order => order
  end

end
