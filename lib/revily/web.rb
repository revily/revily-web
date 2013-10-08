module Revily::Web
  VERSION = "1.0.0"

  class << self
    def user_agent
      "Revily Web v#{Revily::Web::VERSION}"
    end

    def api_endpoint
      ENV['REVILY_API_ENDPOINT'] || "https://api.revi.ly"
    end

    def auth_token
      RequestStore.store[:auth_token]
    end

    def api
      client
    end

    def client
      Client.new
    end
  end


  class Client
    attr_reader :api

    def initialize
      @api = Her::API.setup(connection_options)
    end

    def auth_token
      @auth_token ||= RequestStore.store[:auth_token]
    end

    private

    def connection_options
      opts = {
        headers: {
          accept: "application/vnd.revily.v1+json",
          user_agent: Revily::Web.user_agent,
          content_type: 'application/json; charset=utf-8',
          authorization: "token #{auth_token}"
        },
        url: Revily::Web.api_endpoint,
        builder: middleware
      }
    end

    def middleware
      @middleware ||= Faraday::Builder.new do |builder|
        builder.request :json
        builder.request :authorization, 'token', Request
        builder.use Faraday::Request::UrlEncoded
        builder.use Her::Middleware::DefaultParseJSON
        builder.adapter :net_http
      end
    end

    def method_missing(meth, *args, &block)
      if @api.respond_to?(meth)
        @api.send(meth, *args, &block)
      else
        super
      end
    end

    def respond_to?(meth)
      @api.respond_to?(meth)
    end

  end

end
