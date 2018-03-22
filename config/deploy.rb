# frozen_string_literal: true

# include default configuration for futuregov rails apps
require 'capistrano/futuregov/config'

# Override the slack channel, default is #development
set :slack_channel, '#giz_solutions'

# Verify application is responding after deploy
set :deploy_verify_url, -> {
  'giz-solutions.wearefuturegov.com'
}
