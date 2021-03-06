# To change this template, choose Tools | Templates
# and open the template in the editor.

class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_product(product)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.increment_quantity
    else
      current_item = CartItem.new(product)
      @items << current_item
    end
    current_item
  end

  def del_product(product)
    current_item = @items.find {|item| item.product == product}
    if current_item
      current_item.decrement_quantity
      @items.delete(current_item) if total_items.zero?
    end
    current_item
  end

  def clear
    @items.clear
  end

  def del_item(item)
    @items.delete(item)
  end

  def total_price
    @items.sum { |item| item.price }
  end

  def total_items
    @items.sum { |item| item.quantity }
  end
end
