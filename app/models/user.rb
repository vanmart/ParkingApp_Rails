# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  last_name              :string(255)
#  document               :integer
#  phone                  :string(255)
#  role                   :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :parking_users

  validates :name, presence: true,
                    format: { with: /\A\S[a-zA-Z\s]*\S\z/ }
  validates :last_name, presence: true,
                    format: { with: /\A\S[a-zA-Z\s]*\S\z/ }
  validates :phone, presence: true,
                    :numericality => {:only_integer => true}
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :role, presence: true

  before_save { email.downcase! }
  
  before_validation(on: :create) do
    if self.role.blank?
      self.role = 'visitor'
    end
  end

  def roles
    ROLES.reject do |r|
      ROLES.index(r)
    end
  end

  ROLES = %w[admin parking_owner employee visitor]

  def role?(base_role)
    self.role == base_role.to_s
  end

  def role_enum
    ROLES
  end

  
  rails_admin do
    configure :parking_users do
      visible false
    end
    configure :role, :enum do
      enum_method do
        :role_enum
      end
    end

    configure :reset_password_sent_at do
      visible false
    end

    configure :remember_created_at do
      visible false
    end

    configure :sign_in_count do
      read_only true
    end

    configure :last_sign_in_ip do
      read_only true
    end

    configure :current_sign_in_ip do
      read_only true
    end

    configure :current_sign_in_at do
      read_only true
    end

    configure :last_sign_in_at do
      read_only true
    end
  end
end
