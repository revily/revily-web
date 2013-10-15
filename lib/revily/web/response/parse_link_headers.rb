module Revily::Web
  class ParseLinkHeaders < Faraday::Response::Middleware

    def on_complete(env)
      metadata = env[:body][:metadata]
      metadata[:pagination] ||= {}

      links = ( env[:response_headers]["Link"] || "" ).split(', ').map do |link|
        href, name = link.match(/<(.*?)>; rel="(\w+)"/).captures
        metadata[:pagination][name] = href
      end
    end

  end
end

Faraday.register_middleware :response, :parse_link_headers => Revily::Web::ParseLinkHeaders
