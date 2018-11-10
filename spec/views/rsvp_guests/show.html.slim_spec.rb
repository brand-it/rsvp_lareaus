# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rsvp_guests/show', type: :view do
  let(:rsvp_guest) { create :rsvp_guest }

  before do
    assign(:rsvp_guest, rsvp_guest)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to include(rsvp_guest.name)
  end

  it 'displays the text if you dont plan on attending' do
    rsvp_guest.update!(attending: false)
    render
    expect(rendered).to include('Thanks for taking the time to RSVP')
  end

  it 'displays the attending text' do
    rsvp_guest.update!(attending: true)
    render
    expect(rendered).to include('Looking forward to seeing you at the wedding')
  end
end
