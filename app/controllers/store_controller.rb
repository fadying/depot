class StoreController < ApplicationController
  def index
    @products = Product.all
	increament_counter
  end

end
