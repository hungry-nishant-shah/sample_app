class CreateVendorSpecialities < ActiveRecord::Migration
  def change
    create_table :vendor_specialities do |t|
      t.integer :vendor_id
      t.integer :speciality_id

      t.timestamps
    end
  end
end
