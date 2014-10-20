require 'will_paginate/array'

class VendorsController < ApplicationController
  def index
    flash[:success] = params
    @vendors = nil

    if params[:what] && !params[:what].empty?
      puts "Have something in what"
      vendor_name_results = Vendor.search_by_name(params[:what])
      vendor_speciality_results =  Vendor.search_by_speciality(params[:what])
      if vendor_speciality_results.nil?
        vendor_speciality_results = []
      end
      vendor_items_result = Vendor.search_by_item(params[:what])
      if vendor_items_result.nil?
        vendor_items_result = []
      end
      @vendors ||= (vendor_name_results + vendor_speciality_results + vendor_items_result)
    else
      puts "Have nothing in params what"
      @vendors = Vendor.paginate(:page => params[:page], :per_page => 20)
    end

    if params[:where] && !params[:where].empty?
      near_by = Vendor.near(params[:where],10)
      if near_by.nil?
        near_by = []
      end
      near_by.each {|x| puts x.name}
      puts "-------------------------"
      @vendors.each {|x| puts x.name}
      @vendors = (@vendors & near_by)
    end

    if 1.to_s == params[:sort_by_expensiveness]
      puts "sorting by expensivness"
      # @vendors = @vendors.order('vendors.expensiveness DESC')
      @vendors = @vendors.sort_by(&:expensiveness)
      @vendors = @vendors.reverse
    end
    
    @vendors = @vendors.paginate(:page => params[:page],
        :per_page => 20, :total_entries => @vendors.count)
  end

  def new
    @vendor = Vendor.new
    @specialities = Speciality.all
  end

  def create
    #params[:vendor][:image].tempfile = nil
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      
      ids = params[:vendor][:speciality_ids]
      ids.each do |x|
        vendorSpec = VendorSpeciality.new(:vendor_id => @vendor.id, :speciality_id => x)
        vendorSpec.save
      end
      
      flash[:success] = "Successfully created vendor"

      redirect_to @vendor
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @vendor = Vendor.find(params[:id])
    @menu = @vendor.menu
  end

  def update
  end

  def destroy
  end

  private 
    def vendor_params
      params.require(:vendor).permit(:name, :image, :address, :latitude, :longitude,:expensiveness)
    end

end
