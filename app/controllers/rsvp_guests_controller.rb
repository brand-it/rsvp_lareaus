# frozen_string_literal: true

class RsvpGuestsController < ApplicationController
  def show
    @rsvp_guest = RsvpGuest.find(params[:id])
  end

  def new
    @rsvp_guest = RsvpGuest.new
  end

  def create
    @rsvp_guest = RsvpGuest.find_by(
      first_name: rsvp_guest_params[:first_name], last_name: rsvp_guest_params[:last_name]
    )
    @rsvp_guest ||= RsvpGuest.new
    @rsvp_guest.subscribe(SlackRsvpListener.new)
    @rsvp_guest.assign_attributes(rsvp_guest_params)
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
