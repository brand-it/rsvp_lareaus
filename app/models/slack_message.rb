# frozen_string_literal: true

# == Schema Information
#
# Table name: slack_messages
#
#  id            :bigint(8)        not null, primary key
#  channel       :string
#  error_message :string
#  ok            :boolean
#  text          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class SlackMessage < ApplicationRecord
  default_scope { order('created_at DESC') }

  # Turning off the rull for this because it just makes more sense to name it the way slack names things
  # rubocop:disable MethodName
  def self.chat_postMessage(options = {})
    raise 'Option params is not a hash' unless options.is_a?(Hash)

    message = new(
      text: chat_text(options),
      channel: options[:channel]
    )
    response = Slack::Web::Client.new.chat_postMessage(options)
    message.ok = (response['ok'] == true)
    message.save!
  rescue Slack::Web::Api::Error => exception
    message.ok = false
    message.error_message = exception.message
    message.save!
  end
  # rubocop:enable MethodName

  def self.chat_text(options = {})
    if options[:attachments].is_a?(Array) && options[:attachments][0].is_a?(Hash)
      options[:attachments][0][:title]
    elsif options[:text]
      options[:text]
    else
      'Could not figure out the text for this message'
    end
  end
end
