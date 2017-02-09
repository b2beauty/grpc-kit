require 'logger'

module GRPC
  module Kit
    module Logger
      def logger
        LOGGER
      end

      # TODO Should we use config or env var?
      LOGGER = ::Logger.new(STDOUT)
      # TODO Should we use config or env var?
      LOGGER.level = ::Logger::DEBUG
    end
  end
end

module GRPC
  extend Kit::Logger
end
