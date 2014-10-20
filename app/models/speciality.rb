class Speciality < ActiveRecord::Base
	has_many :vendor_specialities
    has_many :vendors, :through => :vendor_specialities

    def Speciality.search_by_speciality_name(query)
        where("name like ?","%#{query}%")
    end
end
