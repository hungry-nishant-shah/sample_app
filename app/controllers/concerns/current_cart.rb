module CurrentCart
  extend ActiveSupport::Concern
  private
   def set_cart
     @cart = Cart.find(session[:cart_id])
     puts "setting cart"
   rescue ActiveRecord::RecordNotFound
     @cart = Cart.create
     session[:cart_id] = @cart.id
     puts "creating carts"
   end
end