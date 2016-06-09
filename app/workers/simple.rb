require 'sidekiq'

class SimpleWorker
  include Sidekiq::Worker

  def perform(how_hard="super hard", how_long=1)
    sleep how_long
    logger.info "Workin' #{how_hard} for #{how_long} seconds"
  end
end
