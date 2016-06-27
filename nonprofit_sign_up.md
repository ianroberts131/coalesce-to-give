#Models#
* User model
  - has one :social_profile, as: :sociable
  - belongs_to :non_profit
  - include a role for admins
  
* Nonprofit model
  - has_one :social_profile, as: :sociable
  - has_many :managers

* Social media profiles
  - belongs_to sociable, polymorphic: true