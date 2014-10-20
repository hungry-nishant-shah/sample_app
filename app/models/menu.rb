class Menu < ActiveRecord::Base
	has_many :items, dependent: :destroy
	has_one :test
	belongs_to :vendor
end
