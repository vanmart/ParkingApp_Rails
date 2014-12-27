# == Schema Information
#
# Table name: leases
#
#  id              :integer          not null, primary key
#  entry_date      :datetime
#  exit_date       :datetime
#  value           :float
#  lease_type_id   :integer
#  vehicle_plate   :string(255)
#  parking_user_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class LeaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
