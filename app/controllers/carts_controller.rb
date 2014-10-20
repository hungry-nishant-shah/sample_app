class CartsController < ApplicationController
  def show
  	@cart = Cart.find(params[:id])
  end

  def destroy
  end

  def clear
  	@cart = Cart.find(params[:id])
  	if @cart.cart_items.delete_all
  		flash[:success] = "Cleared cart"
    else
    	flash[:error] = "Clearing cart failed"
    end
    redirect_to user_cart_path(:id => @cart.id, :user_id => current_user.id)
  end
end
