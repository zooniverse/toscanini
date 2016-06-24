require 'sidekiq'

module Toscanini
  module Workers
    module OldWeatherOCR
      class RequestOCR

        include Sidekiq::Worker

        def perform(name="no filename", how_long=1)

          # TODO: call Nanoweather web service
          # endpoint has just been set up but we may need to negotiate the
          # urls with them a little
          sleep how_long
          logger.info "reading #{name} for #{how_long} seconds"
        end

      end
    end
  end
end
