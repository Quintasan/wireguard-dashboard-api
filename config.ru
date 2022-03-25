require_relative 'config/environment'

if ENV['RACK_ENV'] == "development"
  run ->(env) { WireguardDashboard.call(env) }
else
  run WireguardDashboard.freeze.app
end
