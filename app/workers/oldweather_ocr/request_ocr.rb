require 'sidekiq'

module Toscanini
  module Workers
    module OldWeatherOCR
      class RequestOCR

        include Sidekiq::Worker

        def perform(name="no filename", how_long=1)

          sleep how_long
          logger.info "reading #{name} for #{how_long} seconds"
        end

      end
    end
  end
end
