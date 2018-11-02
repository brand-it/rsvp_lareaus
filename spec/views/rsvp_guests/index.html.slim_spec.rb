# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'rsvp_guests/index', type: :view do
  # before(:each) do
  #   assign(:weddings, [
  #            Wedding.create!,
  #            Wedding.create!
  #          ])
  # end

  it 'renders a list of weddings' do
    render
  end
end
