class StoreController < ApplicationController
  def index
    @products = Product.all
	@cart = current_cart
	increament_counter
  end

end
