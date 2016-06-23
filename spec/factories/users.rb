FactoryGirl.define do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  
  factory :user do
    first_name first_name
    last_name last_name
    email email
    password "password"
    password_confirmation "password"
  end
end
