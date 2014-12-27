# == Schema Information
#
# Table name: parking_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  parking_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class ParkingUser < ActiveRecord::Base
	
	belongs_to :parking
	belongs_to :user
	has_many :leases

	rails_admin do
    	configure :leases do
      		visible false
    	end
  	end
  	
end
