# frozen_string_literal: true

class RsvpGuest < ApplicationRecord
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
end
