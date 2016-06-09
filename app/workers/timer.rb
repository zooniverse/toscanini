require 'sidekiq'
require 'sidetiq'

class TimedWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    secondly(15)
  end

  def perform
    logger.info "ping"
    SimpleWorker.perform_async "pretty hard", 4
  end
end
