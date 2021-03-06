module Revily::Web
  class TokenAuthentication < Faraday::Middleware

    def call(env)
      env[:request_headers]["Authorization"] = "Bearer #{RequestStore.store[:access_token]}"
      @app.call(env)
    end
    
  end
end
