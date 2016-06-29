class Nonprofit < ActiveRecord::Base
  has_many :managers
  has_many :users, through: :managers
end