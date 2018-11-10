# frozen_string_literal: true

# == Schema Information
#
# Table name: rsvp_guests
#
#  id             :bigint(8)        not null, primary key
#  attending      :boolean          default(FALSE), not null
#  email          :string
#  first_name     :string           not null
#  last_name      :string           not null
#  total_adults   :integer          default(1), not null
#  total_children :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

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
