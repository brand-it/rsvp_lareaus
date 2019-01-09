# frozen_string_literal: true

class RsvpGuestsController < ApplicationController
  before_action :redirect_rsvp_guest_invalid, only: [:update]
  def show
    @rsvp_guest = RsvpGuest.find(params[:id])
  end

  def new
    @rsvp_guest = RsvpGuest.find_by(id: cookies[:rsvp_guest_id]) unless current_admin.present?
    @rsvp_guest ||= RsvpGuest.new # rubocop:disable Naming/MemoizedInstanceVariableName
  end

  def create
    @rsvp_guest = find_rsvp_guest_by_name
    @rsvp_guest ||= RsvpGuest.new
    @rsvp_guest.subscribe(SlackRsvpListener.new)
    @rsvp_guest.subscribe(AssignRsvpCookies.new(cookies))
    @rsvp_guest.assign_attributes(rsvp_guest_params)
    @rsvp_guest.save

    respond_with @rsvp_guest do |format|
      format.html do
        if @rsvp_guest.invalid?
          render :new
        elsif current_admin.present?
          redirect_to %i[new rsvp_guest], notice: @rsvp_guest.name
        else
          redirect_to @rsvp_guest
        end
      end
    end
  end

  def update
    @rsvp_guest = RsvpGuest.find(cookies[:rsvp_guest_id])
    @rsvp_guest.subscribe(SlackRsvpListener.new)
    @rsvp_guest.update(rsvp_guest_params)
    respond_with @rsvp_guest
  end

  private

  def rsvp_guest_params
    params.require(:rsvp_guest).permit(
      :first_name, :last_name, :attending, :total_adults, :total_children, :email
    )
  end

  def redirect_rsvp_guest_invalid
    return if cookies[:rsvp_guest_id].present?

    redirect_to %i[new rsvp_guest]
  end

  def find_rsvp_guest_by_name
    RsvpGuest.find_by(
      first_name: rsvp_guest_params[:first_name], last_name: rsvp_guest_params[:last_name]
    )
  end
end
