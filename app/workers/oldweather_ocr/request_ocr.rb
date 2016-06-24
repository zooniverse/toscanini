require 'sidekiq'

module Toscanini
  module Workers
    module OldWeatherOCR
      class RequestOCR

        include Sidekiq::Worker

        def perform(how_hard="super hard", how_long=1)
          how_long = how_long * 2
          
          sleep how_long
          logger.info "reading #{how_hard} for #{how_long} seconds"
        end

      end
    end
  end
end
