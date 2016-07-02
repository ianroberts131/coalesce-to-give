class SocialProfile < ActiveRecord::Base
  belongs_to :sociable, polymorphic: true
end