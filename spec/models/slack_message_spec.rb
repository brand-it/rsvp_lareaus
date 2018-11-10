# frozen_string_literal: true

# == Schema Information
#
# Table name: slack_messages
#
#  id            :bigint(8)        not null, primary key
#  channel       :string
#  error_message :string
#  success       :boolean
#  text          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

describe SlackMessage, type: :model do
  let(:new_slack_client) { Slack::Web::Client.new }
  let(:slack_chat_postMessage_attachment) do
    {
      'ok' => true
    }
  end
  let(:slack_message) { create :slack_message }
  let(:stub_slack_chat_postMessage) do
    allow(Slack::Web::Client).to receive(:new).and_return(new_slack_client)
    allow(new_slack_client).to receive(:chat_postMessage).and_return(slack_chat_postMessage_attachment)
  end

  let(:attachment_message) do
    {
      channel: '@test',
      as_user: true,
      attachments: [
        {
          title: 'This is the title',
          fallback: 'Fall back title',
          title_link: 'https://something.com',
          color: '#12954a',
          text: 'Fancy Text',
          ts: Time.now.to_i,
          footer: 'Github Pull Request',
          footer_icon: 'https://github.com/favicon.ico'
        }
      ]
    }
  end

  describe '.chat_postMessage' do
    context 'when always returns boolean' do
      subject { SlackMessage.chat_postMessage(text: 'cool', channel: '#GSCS') }

      before { stub_slack_chat_postMessage }

      it { is_expected.to be_truthy }
    end

    context 'when channel is missing' do
      subject(:chat_postMessage) { SlackMessage.chat_postMessage(text: 'cool', channel: '#GSCS') }

      before do
        allow(Slack::Web::Client).to receive(:new).and_return(new_slack_client)
        allow(new_slack_client).to receive(:chat_postMessage).and_raise(Slack::Web::Api::Error.new('Sorry'))
      end

      it { expect { chat_postMessage }.not_to raise_exception }
      it { expect { chat_postMessage }.to change(SlackMessage, :count).by(1) }
      it do
        chat_postMessage
        expect(SlackMessage.first.error_message).to eq 'Sorry'
      end
    end
  end

  describe '.chat_text' do
    context 'when attachments with title' do
      subject { SlackMessage.chat_text(attachment_message) }

      it { is_expected.to eq 'This is the title' }
    end

    context 'when test option' do
      subject { SlackMessage.chat_text(text: 'this is my text') }

      it { is_expected.to eq 'this is my text' }
    end

    context 'when error happens' do
      subject { SlackMessage.chat_text }

      it { is_expected.to eq 'Could not figure out the text for this message' }
    end
  end
end
