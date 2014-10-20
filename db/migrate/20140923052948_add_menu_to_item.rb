class AddMenuToItem < ActiveRecord::Migration
  def change
    add_reference :items, :menu, index: true
  end
end
