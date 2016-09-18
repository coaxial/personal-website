Raven.configure do |config|
  sentry = {
    publick_key: ENV.fetch('SENTRY_PUBLIC_KEY', 'missing_sentry_public_key'),
    secret_key: ENV.fetch('SENTRY_SECRET_KEY', 'missing_sentry_secret_key'),
    project_id: ENV.fetch('SENTRY_PROJECT_ID', 'missing_sentry_project_id')
  }
  config.dsn = "https://#{sentry[:public_key]}:#{sentry[:secret_key]}@sentry.io/#{sentry[:project_id]}"
  config.environments = ['staging', 'production']
end
