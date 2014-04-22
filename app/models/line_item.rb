class LineItem < ActiveRecord::Base
  attr_accessible :product_id, :product, :quantity, :cart_id, :price
  belongs_to :product
  belongs_to :cart

  def total_price
  	price * quantity
  end
end
