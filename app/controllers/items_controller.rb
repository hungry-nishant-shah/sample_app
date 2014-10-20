class ItemsController < ApplicationController
  def new
    @vendor = Vendor.find(params[:vendor_id])
    @menu = @vendor.menu
    @item = @menu.items.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @menu = @vendor.menu
    @item = @menu.items.create(item_params)
    if @menu.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to [@vendor,@menu, @item]
    else
      render 'new'
    end
  end

  def show
    @vendor = Vendor.find(params[:vendor_id])
    @menu = @vendor.menu
    @item = Item.find(params[:id])
  end

  def index
    @items = Menu.find(params[:menu_id]).items
  end

  def destroy
  end

  private
    def item_params
      params.require(:item).permit(:name,:price)
    end
end
