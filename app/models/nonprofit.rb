class Nonprofit < ActiveRecord::Base
  has_many :managers
  has_many :users, through: :managers, foreign_key: :user_id
end