require 'sidekiq'

module Toscanini
  module Workers
    class PollOCR

      include Sidekiq::Worker

      def initialize()
        @client = ::Toscanini::Services::Nanoweather.new()
      end

      def extract_ready(result)
        false
      end

      def perform(subject_id)
        begin
          result = @client.check_ocr_progress subject_id
        rescue Exception => ex
        end

      end

    end
  end
end
