class AddWillDeliverToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :will_deliver, :boolean, default: false
  end
end
