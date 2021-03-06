require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'cart should create a new line item when adding a new product' do
    cart = Cart.create
    cart.add_product(products(:one).id, products(:one).price)
    assert_equal 1, cart.line_items.count
    # Add a new product
    cart.add_product(products(:ruby).id, products(:ruby).price)
    assert_equal 2, cart.line_items.count
  end

  test 'cart should update an existing line item when adding an existing product' do
    cart = Cart.create
    cart.add_product(products(:one).id, products(:one).price)
    assert_equal 1, cart.line_items.count
    # Add a new product
    cart.add_product(products(:one).id, products(:one).price)
    assert_equal 1, cart.line_items.count
  end
end
