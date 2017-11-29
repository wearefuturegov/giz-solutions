# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.2'
gem 'rails', '~> 5.1'

# UI
# gem 'draper'
# gem 'jquery-rails'
gem 'haml-rails'
gem 'sass-rails'

gem 'geff', git: 'https://github.com/wearefuturegov/geff.git'

# Some likely gems
# gem 'serviceworker-rails'
# gem 'simple_form'
# gem 'decent_exposure'
# gem "httparty"

gem 'devise'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# DB
gem 'pg'
gem 'puma'
# gem 'rails_service_check', git: 'https://github.com/wearefuturegov/rails_service_check'

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
