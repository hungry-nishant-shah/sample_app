class AddTesttToTest < ActiveRecord::Migration
  def change
    add_reference :tests, :testt, index: true
  end
end
