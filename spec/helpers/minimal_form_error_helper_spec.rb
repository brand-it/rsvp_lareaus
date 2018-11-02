# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MinimalFormErrorHelper, type: :helper do
  include IconHelper
  let(:rsvp_guest) { build :rsvp_guest }
  describe '#minimal_form_errors' do
    subject { minimal_form_errors(rsvp_guest, :first_name) }
    context 'no errors' do
      it { is_expected.to eq nil }
    end
    context 'with errors' do
      before { rsvp_guest.update(first_name: nil) }
      it { is_expected.to_not eq nil }
    end
  end
end
