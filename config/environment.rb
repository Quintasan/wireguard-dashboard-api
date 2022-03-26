require 'bundler'

Bundler.require(:default, ENV.fetch("RACK_ENV", "development"))

Dir['config/initializers/**/*.rb'].sort.each do |initializer|
  full_path = File.expand_path(initializer)
  require_relative full_path
end

application_root = File.expand_path(File.join(__dir__, ".."))

if ENV['RACK_ENV'] == 'development'
  logger = Logger.new($STDOUT)

  listen_folders = [
    File.join(application_root, "routes")
  ]

  loader = ZeitwerkInitalizer.setup(
    logger: logger,
    enable_reloading: true
  )

  ListenInitalizer.setup(
    loader: loader,
    folders: listen_folders,
    logger: logger
  )
end
