require File.expand_path('../boot', __FILE__)

require 'rails/all'


Bundler.require(*Rails.groups)

module AutoFactor
  class Application < Rails::Application

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)   # New line
  end
end
