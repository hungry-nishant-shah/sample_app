class SpecialitiesController < ApplicationController
  def new
    #@vendor = Vendor.find(params[:vendor_id])
    @speciality = Speciality.new
  end

  def create
    @speciality = Speciality.new(speciality_params)
    if @speciality.save
      flash[:success] = "Speciality saved"
      redirect_to [@speciality]
    else
      render 'new'
    end
  end

  def show
    '''
    @vendor = Vendor.find(params[:vendor_id])
    @speciality = Speciality.new(speciality_params)
    if @speciality.save
      @vendorSpec = VendorSpeciality.new(:vendor_id => @vendor.id, :speciality_id => @speciality.id)
      @vendorSpec.save
      flash[:success] = "Speciality saved"
      redirect_to [@vendor, @speciality]
    else
      #render new
    end
    '''
    
  end

  def index
  end

  def destroy
  end

  private 
    def speciality_params
      params.require(:speciality).permit(:name)
    end
end
