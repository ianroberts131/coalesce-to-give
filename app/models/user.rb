class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :managers
  has_many :nonprofits, through: :managers, foreign_key: :nonprofit_id
  accepts_nested_attributes_for :managers

end
