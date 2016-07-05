class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :managers
  has_many :nonprofits, through: :managers
  has_one :social_profile, as: :sociable
  has_many :pictures, as: :imageable
  accepts_nested_attributes_for :managers
  accepts_nested_attributes_for :social_profile

  def can_edit_nonprofit?(nonprofit)
    nonprofit.managers.where(user_id: id).size == 1
  end
  
end
