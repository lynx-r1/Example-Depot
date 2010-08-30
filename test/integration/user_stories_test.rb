require 'test_helper'

class UserStoriesTest < ActionController::IntegrationTest
  fixtures :products

  # A user goes to the index page. They select a product, adding it to their
  # cart, and check out, filling in their details on the checkout form. When
  # they submit, an order is created containing their information, along with a
  # single line item corresponding to the product they added to their cart.

  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "buying a product" do
    LineItem.delete_all
    Order.delete_all
    ruby_book = products(:ruby_book)
    get "/store/index"
    assert_response :success
    assert_template "index"

    xml_http_request :put, "/store/add_to_cart", :id => ruby_book.id
    assert_response :success


    cart = session[:cart]
    assert_equal 1, cart.items.size
    assert_equal ruby_book, cart.items[0].product

    post "/store/checkout"
    assert_response :success
    assert_template "checkout"

    post_via_redirect "/store/save_order",
      :order => { :name => "Jack R",
      :address => "Trosna",
      :email => "lynx_r@lynx.ru",
      :pay_type => "check"
      }

    assert_response :success
    assert_template "index"
    assert_equal 0, session[:cart].items.size

    orders = Order.find(:all)
    assert_equal 1, orders.size
    order = orders[0]

    assert_equal("Jack R", order.name)
    assert_equal("Trosna", order.address)
    assert_equal("lynx_r@lynx.ru", order.email)
    assert_equal("check", order.pay_type)

    assert_equal(1, order.line_items.size)
    line_item = order.line_items[0]
    assert_equal(ruby_book, line_item.product)
  end
end
