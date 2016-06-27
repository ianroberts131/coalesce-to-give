class Manager < ActiveRecord::Base
  belongs_to :user
  belongs_to :nonprofit
  accepts_nested_attributes_for :nonprofit

end