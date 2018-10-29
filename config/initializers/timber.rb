# frozen_string_literal: true

# Timber.io Ruby Configuration - Simple Structured Logging
#
#  ^  ^  ^   ^      ___I_      ^  ^   ^  ^  ^   ^  ^
# /|\/|\/|\ /|\    /\-_--\    /|\/|\ /|\/|\/|\ /|\/|\
# /|\/|\/|\ /|\   /  \_-__\   /|\/|\ /|\/|\/|\ /|\/|\
# /|\/|\/|\ /|\   |[]| [] |   /|\/|\ /|\/|\/|\ /|\/|\
# -------------------------------------------------------------------
# Website:       https://timber.io
# Documentation: https://timber.io/docs
# Support:       support@timber.io
# -------------------------------------------------------------------
if ENV['TIMBER_ENABLED'] == 'true' && Rails.application.credentials.dig(:timber, :api_key).present?
  Timber.config.logrageify!

  config = Timber::Config.instance
  config.integrations.action_view.silence = true

  # Add additional configuration here.
  # For common configuration options see:
  # https://timber.io/docs/languages/ruby/configuration
  #
  # For a full list of configuration options see:
  # http://www.rubydoc.info/github/timberio/timber-ruby/Timber/Config

  # Install the Timber.io logger
  # ----------------------------
  # Remove the `http_device` to stop sending development logs to Timber.
  # Be sure to keep the `file_device` or replace it with `STDOUT`.
  http_device = Timber::LogDevices::HTTP.new(Rails.application.credentials.dig(:timber, :api_key))
  file_device = File.open(Rails.application.config.paths['log'].first, 'a')
  file_device.binmode

  # Do not modify below this line. It's important to keep the `Timber::Logger`
  # because it provides an API for logging structured data and capturing context.
  logger = Timber::Logger.new(http_device, file_device)
  logger.level = Rails.logger.level
  Rails.logger = ActiveSupport::TaggedLogging.new(logger)
else
  Rails.logger = Logger.new(Rails.application.config.paths['log'].first)
  Rails.logger.formatter = Beautiful::Log::Formatter.new
end

if ENV['TIMBER_ENABLED'] == 'true' && Rails.application.credentials.dig(:timber, :api_key).blank?
  Rails.logger.warn(
    '$TIMBER_ENABLED is enabled but could not find a timber api key. Please set using $TIMBER_API_KEY'\
    " Timeber will be disabled #{Rails.application.credentials.dig(:timber, :api_key).inspect}"
  )
end
