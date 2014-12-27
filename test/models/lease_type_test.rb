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

require 'test_helper'

class LeaseTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
