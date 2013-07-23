require 'turnip/capybara'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist
Capybara.configure do |config|
  config.always_include_port = true
end

def switch_to_subdomain(subdomain)
  hostname = subdomain ? "#{subdomain}.lvh.me" : "lvh.me"
  Capybara.app_host = "http://#{hostname}"
end

def switch_to_main_domain
  switch_to_subdomain nil
end

RSpec.configure do |config|
  switch_to_main_domain
end

# Requires turnip steps
Dir.glob("spec/steps/**/*.rb").each { |f| load f, true }
