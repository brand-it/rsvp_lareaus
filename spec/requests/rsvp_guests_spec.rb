# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RsvpGuests', type: :request do
  describe 'GET /rsvp_guests' do
    it 'works! (now write some real specs)' do
      get rsvp_guests_path
      expect(response).to have_http_status(200)
    end
  end
end
