Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :google_oauth2, Rails.application.secrets.google_client_id, Rails.application.secrets.google_client_secret
end
