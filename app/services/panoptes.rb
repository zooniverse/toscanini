require 'panoptes/client'

module Toscanini
  module Services
    class Panoptes
      attr_reader :client

      def initialize(url, client_id, client_secret)
        @client = ::Panoptes::Client.new(url: url, auth: {client_id: client_id, client_secret: client_secret})
      end

      def retire(subject_state)
        client.retire_subject(subject_state.workflow_id, subject_state.subject_id)
      end

      def fetch_retired(workflow_id)
        raise NotImplementedError, "Waiting for support in panoptes-client gem"
      end
    end
  end
end
