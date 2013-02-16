require 'turnip/capybara'

# Requires turnip steps
Dir[Rails.root.join("spec/steps/**/*.rb")].each { |f| load f, true }
