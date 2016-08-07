FactoryGirl.define do
  factory :product do
    name     	{ Faker::Name.name }
    price       { Faker::Number.number(3) }
    description { Faker::Lorem.paragraph }
  end
end