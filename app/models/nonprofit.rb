class Nonprofit < ActiveRecord::Base
  has_many :managers
  has_many :users, through: :managers
  has_one :social_profile, as: :sociable
  accepts_nested_attributes_for :social_profile
end