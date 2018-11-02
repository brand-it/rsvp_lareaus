# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RsvpGuestsController, type: :routing do
  describe 'routing' do
    # it 'routes to #index' do
    #   expect(get: '/weddings').to route_to('weddings#index')
    # end

    it 'routes to #new' do
      expect(get: '/rsvp_guests/new').to route_to('rsvp_guests#new')
    end

    it 'routes to #show' do
      expect(get: '/rsvp_guests/1').to route_to('rsvp_guests#show', id: '1')
    end

    # it 'routes to #edit' do
    #   expect(get: '/weddings/1/edit').to route_to('weddings#edit', id: '1')
    # end

    it 'routes to #create' do
      expect(post: '/rsvp_guests').to route_to('rsvp_guests#create')
    end

    # it 'routes to #update via PUT' do
    #   expect(put: '/weddings/1').to route_to('weddings#update', id: '1')
    # end

    # it 'routes to #update via PATCH' do
    #   expect(patch: '/weddings/1').to route_to('weddings#update', id: '1')
    # end

    # it 'routes to #destroy' do
    #   expect(delete: '/weddings/1').to route_to('weddings#destroy', id: '1')
    # end
  end
end
