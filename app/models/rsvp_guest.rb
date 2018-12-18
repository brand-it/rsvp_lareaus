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

class RsvpGuest < ApplicationRecord
  include Wisper::Publisher

  after_commit :publish_rsvp_guest_created, on: :create
  after_commit :publish_rsvp_guest_updated, on: :update
  validates :first_name, presence: true
  validates :last_name, presence: true
  def name
    [first_name, last_name].join(' ')
  end

  def total_adults_attending
    return total_adults if attending?

    0
  end

  def total_children_attending
    return total_children if attending?

    0
  end

  private

  def publish_rsvp_guest_created
    publish(:rsvp_guest_created, self)
  end

  def publish_rsvp_guest_updated
    publish(:rsvp_guest_updated, self)
  end
end
