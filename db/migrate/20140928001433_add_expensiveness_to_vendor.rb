class AddExpensivenessToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :expensiveness, :integer, default: 0
  end
end
