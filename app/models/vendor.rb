class Vendor < ActiveRecord::Base
  mount_uploader :image, ImageUploaderUploader
  has_one :menu
  has_one :test
  has_many :vendor_specialities
  has_many :specialities, :through => :vendor_specialities
  validates :name,  presence: true, length: { maximum: 50 }
  geocoded_by :address
  after_validation :geocode

  def self.search_by_name(query)
  	where("name like ?", "%#{query}%")
  end

  def self.search_by_speciality(query)
  	specialities = Speciality.search_by_speciality_name(query)
  	specialities.first.vendors if !specialities.first.nil?
  end

  def Vendor.search_by_item(query)
      ids = Menu.joins(:items).where("items.name like ?", "%#{query}%").collect(&:id)
      where(:id => ids)
  end
end
