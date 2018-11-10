# frozen_string_literal: true

shared_context 'slack_messages' do # rubocop:disable RSpec/ContextWording
  let(:stub_chat_postMessage) do
    allow(SlackMessage).to receive(:chat_postMessage).and_return(vcr_chat_postMessage)
  end
  let(:vcr_chat_postMessage) do
    VCR.use_cassette('slack/chat_postMessage') do
      SlackMessage.chat_postMessage(
        channel: '#rsvp',
        as_user: true,
        attachments: [
          {
            title: 'Sorry this is a test to make sure everything is working',
            color: '#1edb7c',
            text: 'Is this working I Hope so',
            ts: Time.now.to_i,
            footer: 'RSVP'
          }
        ]
      )
    end
  end
end
