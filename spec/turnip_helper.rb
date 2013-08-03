require 'turnip/capybara'
require 'capybara/poltergeist'
require 'site_prism'

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

$:.unshift('.')
Dir.glob("spec/sections/**/*.rb").each { |f| require f }
Dir.glob("spec/pages/**/*.rb").each { |f| require f }
Dir.glob("spec/steps/**/*.rb").each { |f| load f, true }
