# frozen_string_literal: true

class AssignRsvpCookies
  attr_reader :cookies
  def initialize(cookies)
    @cookies = cookies
  end

  def rsvp_guest_created(rsvp_guest)
    cookies[:rsvp_guest_id] = rsvp_guest.id
  end
  alias rsvp_guest_updated rsvp_guest_created
end
