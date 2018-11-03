# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RsvpGuest, type: :model do
  let(:rsvp_guest) { build :rsvp_guest }
  describe '#name' do
    subject { rsvp_guest.name }
    it { is_expected.to eq "#{rsvp_guest.first_name} #{rsvp_guest.last_name}" }
  end

  describe '#total_adults_attending' do
    subject { rsvp_guest.total_adults_attending }
    before {  rsvp_guest.total_adults = 2 }
    context 'not attending' do
      before { rsvp_guest.attending = false }
      it { is_expected.to eq 0 }
    end

    context 'attending' do
      before { rsvp_guest.attending = true }
      it { is_expected.to eq rsvp_guest.total_adults }
    end
  end

  describe '#total_children_attending' do
    subject { rsvp_guest.total_children_attending }
    before {  rsvp_guest.total_children = 2 }
    context 'not attending' do
      before { rsvp_guest.attending = false }
      it { is_expected.to eq 0 }
    end

    context 'attending' do
      before { rsvp_guest.attending = true }
      it { is_expected.to eq rsvp_guest.total_children }
    end
  end
end
