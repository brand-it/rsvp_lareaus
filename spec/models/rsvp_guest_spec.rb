# frozen_string_literal: true

# == Schema Information
#
# Table name: rsvp_guests
#
#  id             :bigint(8)        not null, primary key
#  attending      :boolean          default(FALSE), not null
#  email          :string
#  first_name     :string           not null
#  last_name      :string           not null
#  total_adults   :integer          default(1), not null
#  total_children :integer          default(0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

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

    context 'when not attending' do
      before { rsvp_guest.attending = false }

      it { is_expected.to eq 0 }
    end

    context 'when attending' do
      before { rsvp_guest.attending = true }

      it { is_expected.to eq rsvp_guest.total_adults }
    end
  end

  describe '#total_children_attending' do
    subject { rsvp_guest.total_children_attending }

    before {  rsvp_guest.total_children = 2 }

    context 'when not attending' do
      before { rsvp_guest.attending = false }

      it { is_expected.to eq 0 }
    end

    context 'when attending' do
      before { rsvp_guest.attending = true }

      it { is_expected.to eq rsvp_guest.total_children }
    end
  end
end
