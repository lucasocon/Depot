OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '669320193181150', '168b4f16448b06f5afa3b4ae5f7de493', {:client_options => {:ssl => {:verify => false}}}
end