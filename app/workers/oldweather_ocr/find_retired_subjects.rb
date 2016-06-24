require 'sidekiq'
require 'sidetiq'
require 'yaml'

module Toscanini
  module Workers
    module OldWeatherOCR
      class FindRetiredSubjects
        include Sidekiq::Worker
        include Sidetiq::Schedulable

        OldWeatherGridWorkflowId = 1234

        def config_path(filename)
          File.expand_path(File.join('..', '..', '..', '..', 'config', filename), __FILE__)
        end

        def load_config(filename, environment)
          path = config_path(filename)
          YAML.load_file(path).fetch(environment.to_s)
        end

        def initialize()
          panoptes_config = load_config("panoptes.yml", "development")
          @panoptes = Toscanini::Services::Panoptes.new(panoptes_config.fetch("url"),
                                                 panoptes_config.fetch("client_id"),
                                                 panoptes_config.fetch("client_secret"))
          logger.info "initializer done"
        end

        recurrence do
          minutely(1)
        end

        def perform
          logger.info "Looking for retired subjects in workflow #{OldWeatherGridWorkflowId}"

          begin
            retirees = @panoptes.fetch_retired OldWeatherGridWorkflowId

            retirees.each do | subject |
              RequestAggregation.perform_async OldWeatherGridWorkflowId, subject.id
            end
          rescue NotImplementedError => ex
            logger.warn "Could not request aggregation for retired subjects: #{ex.to_s}"
          end

          # testing purposes
          RequestAggregation.perform_async OldWeatherGridWorkflowId, 4
        end

      end
    end
  end
end
