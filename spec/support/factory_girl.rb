require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :bar do
    sequence(:title) {|n| "The Good Life #{n}" }
    address '43 Lemon St'
    city 'Boston'
    state 'MA'
    zip_code '02113'
    description 'local boston bar'
    price_range 'low'
  end

  factory :review do
    rating '3'
    body 'good'
  end

end
