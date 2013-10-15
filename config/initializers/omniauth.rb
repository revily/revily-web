require 'omniauth/strategies/revily'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :revily, ENV["REVILY_API_CLIENT_ID"], ENV["REVILY_API_CLIENT_SECRET"], scope: "read,write"
end