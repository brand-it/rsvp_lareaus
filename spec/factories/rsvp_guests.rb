# frozen_string_literal: true

FactoryBot.define do
  factory :rsvp_guest do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    attending { [true, false].sample }
    total_adults { Faker::Number.number(2).to_i }
    total_children { Faker::Number.number(2).to_i }
  end
end
