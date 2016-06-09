sidekiq_config = { url: ENV['JOB_WORKER_URL'] }

Sidekiq.configure_server do |config|
    config.redis = sidekiq_config
    config.average_scheduled_poll_interval = 5
end

Sidekiq.configure_client do |config|
    config.redis = sidekiq_config
end

require 'sidetiq'
Sidetiq.configure do |config|
  config.utc = true
end
