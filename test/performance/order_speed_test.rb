require 'test_helper'
require 'store_controller'

LYNX_DETAILS = {
  :name => "Jack R",
  :address => "Trosna",
  :email => "lynx_r@lynx.ru",
  :pay_type => "check"
}

class OrderSpeedTest < ActionController::TestCase
  tests StoreController

  def setup
    @controller = StoreController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  self.fixture_path = File.join(File.dirname(__FILE__), "../fixtures/perfomance")
  fixtures :products

  def test_100_orders
    Order.delete_all
    LineItem.delete_all

    @controller.logger.silence do
      elapsed_time = Benchmark.realtime do
        100.downto(1) do |prd_id|
          cart = Cart.new
          cart.add_product(Product.find(prd_id))
          post :save_order,
            {:order => LYNX_DETAILS},
            {:cart => cart}
          assert_redirected_to :action => :index
        end
      end
      assert_equal(100, Order.count)
      assert(elapsed_time, "Too long.")
    end
  end
end