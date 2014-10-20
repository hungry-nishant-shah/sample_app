class Ingredient < ActiveRecord::Base
	has_many :item_ingredients
	has_many :items, :through => :item_ingredients
end
