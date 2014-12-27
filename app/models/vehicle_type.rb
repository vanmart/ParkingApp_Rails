# == Schema Information
#
# Table name: vehicle_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class VehicleType < ActiveRecord::Base
	
	has_many :lease_types

	validates_uniqueness_of :name
  validates_presence_of :name

  rails_admin do
    	   
      configure :lease_types do
          visible false
      end
 	end
end
