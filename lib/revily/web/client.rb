require 'revily/web/request/token_authentication'
require 'revily/web/response/parse_link_headers'

module Revily::Web
  class Client
    attr_reader :api

    def initialize
      @api = Her::API.setup(connection_options)
    end

    def get(*args)
      api.connection.get(*args)
    end

    def post(*args)
      api.connection.post(*args)
    end

    def patch(*args)
      api.connection.patch(*args)
    end

    def put(*args)
      api.connection.put(*args)
    end

    def delete(*args)
      api.connection.delete(*args)
    end

    private

    def connection_options
      opts = {
        headers: {
          accept: "application/vnd.revily.v1+json",
          user_agent: Revily::Web.user_agent,
          content_type: "application/json; charset=utf-8"
        },
        url: Revily::Web.api_endpoint,
        builder: middleware
      }
    end

    def middleware
      @middleware ||= Faraday::Builder.new do |builder|
        builder.request :json
        builder.request :token_authentication
        builder.request :url_encoded

        builder.response :parse_link_headers
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
