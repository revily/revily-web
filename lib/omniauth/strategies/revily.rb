module OmniAuth::Strategies
  class Revily < OmniAuth::Strategies::OAuth2
    option :name, :revily
    option :client_options, {
      site: ENV["REVILY_API_ENDPOINT"],
      authorize_url: "/oauth/authorize"
    }
    option :provider_ignores_state, true

    uid do
      raw_info["id"].to_s
    end

    info do
      { email: raw_info["email"], name: raw_info["name"] }
    end

    extra do
      { raw_info: raw_info }
    end

    def request_phase
      f = OmniAuth::Form.new(title: "Revily", url: callback_path)
      f.text_field "Email", "username"
      f.password_field "Password", "password"
      f.button "Sign In"
      f.to_response
    end
    
    def raw_info
      @raw_info ||= access_token.get("/me").parsed
    end

    protected

    def build_access_token
      username, password = request.params.values_at("username", "password")
      client.password.get_token(username, password)
    end
  end
end
