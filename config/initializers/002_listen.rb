require "listen"

class ListenInitalizer
  class << self
    def setup(loader:,
              folders: [],
              ignore: [],
              wait_for_delay: nil,
              logger: Logger.new(IO::NULL)
             )

      Listen.logger = logger

      listen_options = {
        ignore: [/\A\.?#/],
      }

      listen_options.merge!(wait_for_delay: wait_for_delay) if wait_for_delay

      listen_options[:ignore].concat(ignore) unless ignore.empty?

      directories = loader.dirs + folders

      Listen.to(*directories, listen_options) do
        loader.reload
        yield if block_given?
      end.start
    end
  end
end
