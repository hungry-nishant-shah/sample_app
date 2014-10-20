class AddMenuToTest < ActiveRecord::Migration
  def change
    add_reference :tests, :menu, index: true
  end
end
