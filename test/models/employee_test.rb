# == Schema Information
#
# Table name: employees
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  last_name  :string(255)
#  phone      :integer
#  email      :string(255)
#  parking_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
