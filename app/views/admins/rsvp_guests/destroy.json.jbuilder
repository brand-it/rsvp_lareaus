# frozen_string_literal: true

json.extract! @rsvp_guest, :id
json.total_adults_attending @rsvp_guests.map(&:total_adults_attending).inject(:+).to_i
json.total_children_attending @rsvp_guests.map(&:total_children_attending).inject(:+).to_i
