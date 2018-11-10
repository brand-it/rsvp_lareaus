# frozen_string_literal: true

require 'slack-ruby-client'
# rubocop:disable Style/GuardClause
if Rails.env.production? && Rails.application.credentials.dig(:slack, :api_token).blank?
  # rubocop:enable Style/GuardClause
  raise 'Missing Rails.application.credentials.dig(:slack, :api_token)!'
elsif Rails.application.credentials.dig(:slack, :api_token).blank?
  puts 'Missing slack api_token in credentails. Set it using export SLACK_API_TOKEN=\'value\'!'
end

Slack.configure do |config|
  config.token = Rails.application.credentials.dig(:slack, :api_token)
  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger::WARN
end
