class CombineItemsInCart < ActiveRecord::Migration
  # replace multiple items for a single product in a cert with a single item
  def change
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          cart.line_items.where(:product_id => product_id).delete_all

          # replace with a single item
          cart.line_items.create(:product_id=>product_id, :quantity=>quantity)
        end
      end
    end
  end
end
