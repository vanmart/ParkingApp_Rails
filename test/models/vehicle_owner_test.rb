# == Schema Information
#
# Table name: vehicle_owners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  last_name  :string(255)
#  document   :string(255)
#  email      :string(255)
#  phone      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class VehicleOwnerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
