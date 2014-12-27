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

class VehicleOwner < ActiveRecord::Base
   
  has_many :leases

  validates :name, presence: true,
  									format: { with: /\A\S[a-zA-Z\s]*\S\z/ }
  validates :last_name, presence: true,
  									format: { with: /\A\S[a-zA-Z\s]*\S\z/ }
  validates :phone, :numericality => {:only_integer => true}
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  before_save { email.downcase! }


	rails_admin do
	    configure :leases do
	      visible false
	    end
	end
end
