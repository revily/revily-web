source "https://rubygems.org"

gem "rails", "4.0.0"

#TODO: use a proper gem
gem "revily-client",                                  github: "revily/revily-client"

gem "coffee-rails",                         "4.0.0"
gem "dotenv-rails",                         "0.9.0"
# gem "haml-rails", 
gem "her",                                  "0.6.8"
gem "jquery-rails",                         "3.0.4"
gem "omniauth",                             "1.1.4"
gem "omniauth-oauth2",                      "1.1.1"
gem "recipient_interceptor",                "0.1.2"
gem "redis-rails",                          "4.0.0"
gem "request_store",                        "1.0.5"
gem "sass-rails",                           "4.0.0"
gem "simple_form"
gem "therubyracer",                         "0.12.0", platforms: :ruby
gem "turbolinks",                           "1.3.0"
gem "uglifier",                             "2.2.1"
gem "unicorn",                              "4.6.3"

group :development do
  gem "foreman",                           "0.63.0"
  gem "guard-rspec",                       "3.1.0",   require: false
  gem "guard-spork",                       "1.5.1",   require: false
  gem "guard-shell",                       "0.5.1",   require: false
  gem "libnotify",                         "0.8.2",   require: false
  gem "method_profiler",                   "2.0.1",   require: false
  gem "perftools.rb",                      "2.0.1",   require: false
  gem "pry-rails",                         "0.3.2"
  gem "rblineprof",                        "0.3.2",   require: false
  gem "rbtrace",                           "0.4.1",   require: false
  gem "rb-fsevent",                        "0.9.3",   require: false
  gem "rb-inotify",                        "0.9.2",   require: false
  gem "ruby-graphviz",                     "1.0.9",   require: false
  gem "ruby-prof",                         "0.13.0",  require: false
  gem "ruby_gntp",                         "0.3.4",   require: false
  gem "spork-rails",                                  github: "sporkrb/spork-rails", require: false
end

group :test do
  gem "capybara",                          "2.1.0"
  gem "json_spec",                         "1.1.1"
  gem "rspec-instafail",                   "0.2.4"
  gem "rspec-rails",                       "2.14.0"
  gem "shoulda-matchers",                  "2.4.0",   require: false
  gem "timecop",                           "0.6.1"
  gem "webmock",                           "1.14.0"
  gem "vcr",                               "2.6.0"
end

# Gems useful in both test and development environments
group :development, :test do
  gem "awesome_print",                     "1.2.0"
  gem "factory_girl_rails",                "4.2.1"
  gem "forgery",                           "0.5.0"
  gem "sham_rack",                         "1.3.6"
end

group :development, :test, :staging, :production do
  gem "airbrake",                          "3.1.14"
  gem "newrelic_rpm",                      "3.6.8.164"
end

group :doc do
  gem "redcarpet"
  gem "yard"
end
