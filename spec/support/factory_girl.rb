require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name 'Joe'
    last_name 'Sample'
    sequence(:username) {|n| "joesample#{n}"}
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :league do
    association :user
    sequence(:title) {|n| "Best League #{n}"}
    description 'This is the best league ever!'
  end

  factory :membership_request do
    association :user
    association :league
  end

  factory :membership do
    association :user
    association :league
  end

  factory :week do
    week_number 1
  end

  factory :league_pick do
    association :league_game
    association :membership
  end
end
