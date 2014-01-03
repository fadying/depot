class StoreController < ApplicationController
  skip_before_filter :authorize
  include CurrentCart
  before_action :set_cart, only: [:index]

  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.all
      #@cart = current_cart
      increament_counter
    end
  end

end
