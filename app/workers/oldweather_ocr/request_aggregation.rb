require 'sidekiq'

module Toscanini
  module Workers
    module OldWeatherOCR
      class RequestAggregation
        include Sidekiq::Worker

        def perform(how_hard="super hard", how_long=1)
          sleep how_long
          logger.info "aggregating #{how_hard} for #{how_long} seconds"

          # testing purposes
          RequestOCR.perform_async how_hard, how_long
        end

      end
    end
  end
end
