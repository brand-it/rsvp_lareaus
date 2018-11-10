# frozen_string_literal: true

# == Schema Information
#
# Table name: slack_messages
#
#  id            :bigint(8)        not null, primary key
#  channel       :string
#  error_message :string
#  ok            :boolean
#  text          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryBot.define do
  factory :slack_message do
    channel { '#rsvp' }
    text { 'how it going?' }
    success { true }
  end
end
