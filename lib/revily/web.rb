require 'revily/web/version'
require 'revily/web/client'
require 'revily/web/her_extensions'

module Revily::Web
  class << self
    def user_agent
      "Revily Web v#{Revily::Web::VERSION}"
    end

    def api_endpoint
      ENV['REVILY_API_ENDPOINT'] || "https://api.revi.ly"
    end

    def api
      client
    end

    def client
      Client.new
    end
  end
end
