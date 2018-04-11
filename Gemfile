# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.2'
gem 'rails', '~> 5.1'

# UI
gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'

gem 'geff', git: 'https://github.com/wearefuturegov/geff.git'
gem 'jquery-rails'
gem 'simple_form'

# Some likely gems
# gem 'draper'
# gem 'serviceworker-rails'
# gem "httparty"

gem 'decent_exposure'
gem 'devise'
gem 'dotenv-rails'
gem 'ffaker'

# DB and app server
gem 'pg'
gem 'rails_service_check', git: 'https://github.com/wearefuturegov/rails_service_check'

gem 'aws-sdk-s3'
gem 'paperclip'

gem 'paranoia'

gem 'sendgrid-ruby'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'byebug'
  gem 'capistrano-futuregov', git: 'git@github.com:wearefuturegov/capistrano-futuregov.git', require: false
  gem 'rubocop', require: false
end

# IF HEROKU
group :staging do
  gem 'appsignal'
  gem 'puma'
  gem 'rails_12factor'
end
