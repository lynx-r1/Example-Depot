class StoreController < ApplicationController
  before_filter :find_cart, :except => :empty_cart

  def index
    @products = Product.find_products_for_sale
    @checkout = false

    session[:counter] = 1 if session[:counter].nil?
    session[:counter] += 1

    respond_to do |format|
      format.html
      format.xml { render :layout => false }
    end
  end

  def add_to_cart
    product = Product.find(params[:id])
    @current_item = @cart.add_product(product)
    respond_to_js_or_html
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempt to access invalid product #{params[:id]}")
    redirect_to_index(I18n.t('flash.invalid_product'))
  end

  def empty_cart
    respond_to_js_or_html
    session[:cart] = nil
  end

  def del_from_cart
    product = Product.find(params[:id])
    @current_item = @cart.del_product(product)
    respond_to do |format|
      format.js if request.xhr?
      format.html {
        redirect_to_index
        @cart.del_item(@current_item) if @current_item.quantity == 0
      }
    end
  end

  def checkout
    if @cart.items.empty?
      redirect_to_index(I18n.t('flash.cart_empty'))
      @checkout = false
    else
      @order = Order.new
      @checkout = true
    end
  end

  def save_order
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    if @order.save
      session[:cart] = nil
      redirect_to_index(I18n.t('flash.thanks'))
      @checkout = false
    else
      render :action => 'checkout'
      @checkout = true
    end
  end

  protected

  def authorize
  end

  private

  def find_cart
    @cart = (session[:cart] ||= Cart.new)
  end

  def redirect_to_index(msg = nil)
    flash[:notice] = msg
    redirect_to :action => 'index'
  end

  def respond_to_js_or_html
    respond_to do |format|
      format.js if request.xhr?
      format.html { redirect_to_index }
    end
  end

end
