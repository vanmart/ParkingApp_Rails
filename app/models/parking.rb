# == Schema Information
#
# Table name: parkings
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  email      :string(255)
#  phone      :string(255)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

class Parking < ActiveRecord::Base
	
  has_many :parking_users
  has_many :lease_types

  validates_presence_of :address
  validates :name, presence: true,
                   uniqueness: true      
  validates :phone, presence: true, 
                    numericality: { only_integer: true }
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  before_save { email.downcase! }
  
  rails_admin do
    configure :parking_users do
        visible false
    end
    configure :lease_types do
        visible false
    end
  end
end
