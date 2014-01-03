class StoreController < ApplicationController
  skip_before_filter :authorize
  include CurrentCart
  before_action :set_cart, only: [:index]
  def index
    @products = Product.all
	  #@cart = current_cart
	  increament_counter
  end

end
