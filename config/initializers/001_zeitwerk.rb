require "zeitwerk"

class ZeitwerkInitalizer
  class << self
    def setup(additional_load_paths: [],
              logger: Logger.new(IO::NULL),
              ignore: [],
              enable_reloading: false,
              eager_load: false)

      if enable_reloading && eager_load
        raise "You can't have both eager_load and enable_reloading enabled"
      end

      loader = Zeitwerk::Loader.new

      application_root = File.expand_path(File.join(__dir__, "..", ".."))

      loader.push_dir(application_root)

      additional_load_paths.each do |load_path|
        loader.push_dir(load_path)
      end

      loader.logger = logger

      loader.enable_reloading if enable_reloading

      loader.ignore(ignore) unless ignore.empty?

      loader.setup

      loader.eager_load if eager_load

      loader
    end
  end
end
