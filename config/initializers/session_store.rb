# Be sure to restart your server when you modify this file.

# Revily::Web::Application.config.session_store :cookie_store, key: '_revily-web_session'
Revily::Web::Application.config.session_store :redis_store, redis_server: ENV['REVILY_REDIS_SESSION_URL="redis://localhost:6379/0/sessions"
']
