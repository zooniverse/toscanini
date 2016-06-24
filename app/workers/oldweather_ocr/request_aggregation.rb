require 'sidekiq'

module Toscanini
  module Workers
    module OldWeatherOCR
      class RequestAggregation
        include Sidekiq::Worker

        def perform(workflow_id, subject_id)
          logger.debug "requesting aggregation for subject #{subject_id} in workflow #{workflow_id}"

          # TODO: call aggregation web service
          # note this call will be asynchronous and we need to pass it an
          # endpoint to call back

          # testing purposes
          RequestOCR.perform_async "file name", 8
        end

      end
    end
  end
end
