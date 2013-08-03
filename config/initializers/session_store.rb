# Be sure to restart your server when you modify this file.

Kosynierzy::Application.config.session_store :cookie_store, key: '_kosynierzy.info_session', domain: {
  production: '.kosynierzy.info',
  development: '.kosynierzy.dev',
  test: '.lvh.me'
}.fetch(Rails.env.to_sym, :all)
