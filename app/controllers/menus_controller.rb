class MenusController < ApplicationController
  def new
    @vendor = Vendor.find(params[:vendor_id])
    @menu = @vendor.build_menu
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @menu = @vendor.build_menu(menu_params)

    if @menu.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to [@vendor,@menu]
    else
      render 'new'
    end

  end

  def show
    @vendor = Vendor.find(params[:vendor_id])
    @menu = @vendor.menu
    @items = @menu.items
  end

  def index
  end

  def destroy
  end
  private

    def menu_params
      params.require(:menu).permit(:name)
    end

end
