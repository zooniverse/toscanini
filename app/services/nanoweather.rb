require 'faraday'

module Toscanini
  module Services
    class Nanoweather
      # TODO: call Nanoweather web service

      def initialize()
      end

      def request_ocr()
        raise NotImplementedError
      end

      def check_ocr_progress(subject_id)
        raise NotImplementedError
      end

      def fetch_ocr(subject_id)
        raise NotImplementedError
      end

    end
  end
end
