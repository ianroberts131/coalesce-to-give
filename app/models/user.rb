class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :managers
  has_many :nonprofits, through: :managers
  accepts_nested_attributes_for :managers

  def can_edit_nonprofit?(nonprofit)
    nonprofit.managers.where(user_id: id).size == 1
  end
end
