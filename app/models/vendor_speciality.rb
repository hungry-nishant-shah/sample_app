class VendorSpeciality < ActiveRecord::Base
	belongs_to :vendor
	belongs_to :speciality
end

