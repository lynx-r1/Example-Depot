class Product < ActiveRecord::Base
  def self.find_products_for_sale
    find(:all, :order => "title")
  end

  validates_presence_of :title, :description, :image_url
  validates_numericality_of :price, :message => "is not numeric!!!"
  validates_uniqueness_of :title, :message => "is not unique!"
  validates_length_of :title, :maximum => 10
  validates_format_of :image_url,
    :with    => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG ' +
                'or PNG image.'
  validate :price_must_be_at_least_a_cent

  protected
  def price_must_be_at_least_a_cent
    errors.add(:price, 'should be at least 0.01') if price.nil? ||
      price < 0.01
  end
end
