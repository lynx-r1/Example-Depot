class StoreController < ApplicationController
  def index
    @products = Product.find_products_for_sale
    @cart = find_cart
    @time = Time.now.ctime

    session[:counter] = 1 if session[:counter].nil?
    session[:counter] += 1
  end

  def add_to_cart
    session[:counter] = 0
    product = Product.find(params[:id])
    @cart = find_cart
    @current_item = @cart.add_product(product)
    respond_to do |format|
      format.js
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index("Invalid product")
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index#("Your cart is currently empty")
  end

  private

  def find_cart
    session[:cart] ||= Cart.new
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg
    redirect_to :action => 'index'
  end

end
