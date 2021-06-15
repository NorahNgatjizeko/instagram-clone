require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstagramClone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # config.i18n.default_locale = :ja
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.generators do |g|
      # The description in these two lines creates a Settings that is not automatically generated.
      g.assets false
      g.helper false
  end
end
end
