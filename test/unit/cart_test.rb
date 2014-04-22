require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def new_cart_with_one_product(product_name)
	  cart = Cart.create
	  cart.add_product(products(product_name).id,products(product_name).price)
	  cart
	end

	test 'create cart and add products' do
		cart = new_cart_with_one_product(:one)
		assert_equal 1, cart.line_items.count

		cart.add_product(products(:ruby).id,products(:ruby).price)
		assert_equal 2, cart.line_items.count

		cart.add_product(products(:ruby).id,products(:ruby).price)
		assert_equal 2, cart.line_items.count
	end
end
