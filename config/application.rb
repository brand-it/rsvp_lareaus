# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RsvpLareaus
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.logger = Logger.new(config.paths['log'].first)
    config.logger.formatter = Beautiful::Log::Formatter.new

    config.generators do |generator|
      generator.template_engine :slim
      generator.stylesheets = false
      generator.javascripts = false
    end
  end
end
