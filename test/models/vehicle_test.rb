# == Schema Information
#
# Table name: vehicles
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  vehicle_type_id  :integer
#  vehicle_owner_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
