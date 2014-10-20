class CartItemsController < ApplicationController
  include CurrentCart
  
  before_action :set_cart, only: [:create,:destroy,:delete_one_item]

  def new
  end

  def create
    item = Item.find(params[:item_id])
    @cart_items = @cart.cart_items.build(item: item)
    if @cart_items.save
      flash[:success] = "Great success"
      @cart = @cart_items.cart
      puts cookies
      redirect_to user_cart_path(:id => @cart.id, :user_id => current_user.id)
    else
      flash[:errors] = "Fail and shame to family"
    end
  end

  def show
  end

  def delete_one_item
    cart_items = @cart.cart_items
    if cart_items
      if cart_items.where(:item_id => params[:item_id]).first.delete
        flash[:success] = "Deleted"
      else
        flash[:error] = "Failed delete"
      end
    end
    redirect_to user_cart_path(:id => @cart.id, :user_id => current_user.id)
  end
  
  def destroy
    cart_items = @cart.cart_items
    if cart_items
      if cart_items.delete_all
        flash[:success] = "Cleared cart"
      else
        flash[:error] = "Clearing cart failed"
      end
    end 
    redirect_to user_cart_path(:id => @cart.id, :user_id => current_user.id)

  end

  def index
  end
end
