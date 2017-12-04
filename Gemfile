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

# DB and app server
gem 'appsignal'
gem 'pg'
gem 'puma'
# gem 'rails_service_check', git: 'https://github.com/wearefuturegov/rails_service_check'

gem 'aws-sdk', '~> 2.3'
gem 'paperclip'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'rubocop', require: false
end

# IF HEROKU
group :production, :staging do
  gem 'rails_12factor'
end
