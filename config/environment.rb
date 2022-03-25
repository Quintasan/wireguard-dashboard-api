require 'bundler'

Bundler.require(:default, ENV.fetch("RACK_ENV", "development"))

Dir['config/initializers/**/*.rb'].sort.each do |initializer|
  full_path = File.expand_path(initializer)
  require_relative full_path
end

if ENV['RACK_ENV'] == 'development'
  logger = Logger.new($STDOUT)

  loader = ZeitwerkInitalizer.setup(
    logger: logger,
    enable_reloading: true
  )

  ListenInitalizer.setup(
    loader: loader,
    logger: logger
  )
end
