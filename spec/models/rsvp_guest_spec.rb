# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RsvpGuest, type: :model do
  let(:rsvp_guest) { build :rsvp_guest }
  describe '#name' do
    subject { rsvp_guest.name }
    it { is_expected.to eq "#{rsvp_guest.first_name} #{rsvp_guest.last_name}" }
  end
end
