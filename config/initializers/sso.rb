RailsSso.configure do |config|
  config.magic_enabled = false
  config.provider_url = Figaro.env.account_kosynierzy_host
  config.provider_name = "kosynierzy"
  config.provider_key = Figaro.env.sso_key
  config.provider_secret = Figaro.env.sso_secret
  config.provider_profile_path = "/api/v1/me"
  config.provider_sign_out_path = "/api/v1/me"
end
