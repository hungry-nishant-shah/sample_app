class Item < ActiveRecord::Base
	belongs_to :menu
	has_many :item_ingredients
	has_many :ingredients, :through => :item_ingredients
    has_many :cart_items,dependent: :destroy

	def Item.search_by_item_name(query)
  	  where("name like ?", "%#{query}%")
    end
end
