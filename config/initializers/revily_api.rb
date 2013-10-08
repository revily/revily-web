# module Revily::Web
#   VERSION = "1.0.0"

#   class << self
#     def user_agent
#       "Revily Web v#{Revily::Web::VERSION}"
#     end

#     def api_endpoint
#       ENV['REVILY_API_ENDPOINT'] || "https://api.revi.ly"
#     end

#     def auth_token
#       RequestStore.store[:auth_token]
#     end

#     def connection_options
#       opts = {
#         headers: {
#           accept: "application/vnd.revily.v1+json",
#           user_agent: Revily::Web.user_agent,
#           content_type: 'application/json; charset=utf-8',
#           authorization: "token #{auth_token}"
#         },
#         url: Revily::Web.api_endpoint,
#         builder: middleware
#       }
#     end

#     def middleware
#       @middleware ||= Faraday::Builder.new do |builder|
#         builder.request :json
#         builder.request :authorization, 'token', auth_token
#         builder.use Faraday::Request::UrlEncoded
#         builder.use Her::Middleware::DefaultParseJSON
#         builder.adapter :net_http
#       end
#     end

#     def api
#       @api ||= Her::API.setup(connection_options)
#     end
#   end

#   # def self.api_endpoint
#   #   @api_endpoint ||= Her::API.setup url: ENV['REVILY_API_ENDPOINT'] do |config|
#   #     config.use TokenAuthentication
#   #     config.use Faraday::Request::UrlEncoded
#   #     config.use Her::Middleware::DefaultParseJSON
#   #     config.use Faraday::Adapter::NetHttp
#   #   end
#   # end

#   # def self.api
#   #   @api ||= api_endpoint.connection
#   # end
# end
