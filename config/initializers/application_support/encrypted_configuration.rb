# frozen_string_literal: true

module ActiveSupport
  class EncryptedConfiguration < EncryptedFile
    def read
      super
    rescue ActiveSupport::EncryptedFile::MissingContentError => exception.message
      Rails.logger.warn("ActiveSupport::EncryptedFile::MissingContentError #{exception.message}")
      puts exception.message.to_s.colorize(:yellow)
      ''
    end

    private

    # Added ERB parsing for the config file. Kinda of nice for more dynamic features that
    # could be required.
    def deserialize(config)
      config.present? ? YAML.safe_load(ERB.new(config).result, [], [], false, content_path) : {}
    end
  end
end
