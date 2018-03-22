# frozen_string_literal: true

set :instance_name, 'giz_solutions'
set :rails_env, :production
server 'giz.wearefuturegov.com', roles: %w[app db web]
