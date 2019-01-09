# frozen_string_literal: true

module Admins
  class RsvpGuestsController < Admins::ApplicationController
    def index
      @rsvp_guests = RsvpGuest.all.order(updated_at: :desc)
    end

    def update; end

    def destroy
      @rsvp_guest = RsvpGuest.find(params[:id])
      @rsvp_guest.destroy
      @rsvp_guests = RsvpGuest.all
      respond_with @rsvp_guest
    end

    def edit; end
  end
end
