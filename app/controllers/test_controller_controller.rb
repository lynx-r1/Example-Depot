class TestControllerController < ApplicationController
  def create_order
    order = Order.find_by_name "Jack R"
    email = OrderMailer.create_confirm(order)
    render(:text => "<pre>" + email.encoded + "</pre>")
  end

  def create_html_order
    order = Order.find_by_name "Jack R"
    email = OrderMailer.create_confirm(order)
    email.set_content_type("text/html")
    OrderMailer.deliver(email)
    render(:text => "Thank you...")
  end

  protected

  def authorize
    
  end
end
