OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '121709968427371', '9f9a63e42c42844252d265222a15fa62'
end