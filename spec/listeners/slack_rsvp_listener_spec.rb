# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SlackRsvpListener do
  include_context 'slack_messages'
  let(:listener) { described_class.new }
  let(:rsvp_guest) { create :rsvp_guest }

  describe '#rsvp_guest_created' do
    subject(:rsvp_guest_created) { listener.rsvp_guest_created(rsvp_guest) }

    before { stub_chat_postMessage }

    it { expect { rsvp_guest_created }.not_to raise_exception }
  end
end
