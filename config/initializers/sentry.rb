Raven.configure do |config|
  config.dsn = "https://#{ENV.fetch('SENTRY_PUB_KEY')}:#{ENV.fetch('SENTRY_SECRET_KEY')}@sentry.io/#{ENV.fetch('SENTRY_PROJECT_ID')}"
  config.environments = ['staging', 'production']
end
