# == Schema Information
#
# Table name: lease_types
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  price           :float
#  vehicle_type_id :integer
#  parking_id      :integer
#  lease_time_id   :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class LeaseType < ActiveRecord::Base

  belongs_to :vehicle_type
  belongs_to :parking
  belongs_to :lease_time
  has_many :leases
  
  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :vehicle_type_id
  validates_presence_of :parking_id
	
	rails_admin do
    configure :leases do
      visible false
    end
  end

end
