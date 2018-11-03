# frozen_string_literal: true

class RsvpGuestsController < ApplicationController
  def show
    @rsvp_guest = RsvpGuest.find(params[:id])
  end

  def new
    @rsvp_guest = RsvpGuest.new
  end

  def create
    @rsvp_guest = RsvpGuest.find_by(rsvp_guest_params)
    @rsvp_guest ||= RsvpGuest.new(rsvp_guest_params)
    @rsvp_guest.save

    respond_with @rsvp_guest
  end

  private

  def rsvp_guest_params
    params.require(:rsvp_guest).permit(
      :first_name, :last_name, :attending, :total_adults, :total_children, :email
    )
  end
end
