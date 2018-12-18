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

  describe '#rsvp_guest_updated' do
    subject(:rsvp_guest_updated) { listener.rsvp_guest_updated(rsvp_guest) }

    before do
      rsvp_guest.first_name = Faker::FunnyName.name
      rsvp_guest.attending = !rsvp_guest.attending
      stub_chat_postMessage
    end

    it { expect { rsvp_guest_updated }.not_to raise_exception }
  end

  describe '#slack_attachment_updated' do
    subject(:slack_attachment_updated) { listener.send(:slack_attachment_updated, rsvp_guest) }

    before do
      rsvp_guest.first_name = Faker::FunnyName.name
      rsvp_guest.attending = !rsvp_guest.attending
    end

    it { expect { slack_attachment_updated }.not_to raise_exception }
    it do
      expect(slack_attachment_updated[:attachments][0][:text]).to include(
        "Attending was changed from \"#{rsvp_guest.attending_was ? 'Yes' : 'No'}\""\
        " to \"#{rsvp_guest.attending ? 'Yes' : 'No'}\""
      )
    end
    it do
      expect(slack_attachment_updated[:attachments][0][:text]).to include(
        "First Name was changed from \"#{rsvp_guest.first_name_was}\" to \"#{rsvp_guest.first_name}\""
      )
    end
  end
end
