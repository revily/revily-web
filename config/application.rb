require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

Bundler.require(:default, Rails.env)

module Revily
  module Web
    class Application < Rails::Application
      config.generators do |g|
        g.test_framework      :rspec, view_specs: false, helper_specs: false
        g.fixture_replacement :factory_girl, dir: 'spec/factories'
        g.template_engine     :haml
        g.javascript_engine   :coffee
        g.helper              false
        g.stylesheets         false
      end

      config.autoload_paths += %W[
        #{config.root}/lib
      ]
    end
  end
end
