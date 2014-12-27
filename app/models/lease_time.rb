# == Schema Information
#
# Table name: lease_times
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  seconds    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class LeaseTime < ActiveRecord::Base
	has_many :lease_types

	rails_admin do
      configure :lease_types do
          visible false
      end
 	end

end
