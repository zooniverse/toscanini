require 'faraday'

module Toscanini
  module Services
    class PanoptesAggregation

      def initialize(host, user_id, application_id)
      end

      def aggregate_subject(workflow_id, subject_id, callback_url = "")
        # TODO: call aggregation web service once method is implemented
        raise NotImplementedError, "the method has not been created on the aggregation web service"
      end

    end
  end
end
