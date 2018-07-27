Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :identity, on_failed_registration: lambda { |env|
    IdentitiesController.action(:new).call(env) }
end
