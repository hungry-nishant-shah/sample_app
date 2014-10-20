class CreateTestts < ActiveRecord::Migration
  def change
    create_table :testts do |t|
      t.string :name

      t.timestamps
    end
  end
end
