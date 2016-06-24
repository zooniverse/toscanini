require 'sidekiq'

module Toscanini
  module Workers
    module OldWeatherOCR
      class RequestAggregation
        include Sidekiq::Worker

        def perform(workflow_id, subject_id)
          sleep 5
          logger.info "aggregating #{subject_id} in workflow #{workflow_id}"

          # testing purposes
          RequestOCR.perform_async "file name", 8
        end

      end
    end
  end
end
