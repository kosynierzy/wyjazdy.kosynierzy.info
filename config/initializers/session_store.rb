# Be sure to restart your server when you modify this file.

Kosynierzy::Application.config.session_store :cookie_store, key: '_kosynierzy.info_session', domain: {
  production: '.kosynierzy.info',
  development: '.kosynierzy.dev'
}.fetch(Rails.env.to_sym, :all)

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Kosynierzy::Application.config.session_store :active_record_store
