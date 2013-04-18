require 'turnip/capybara'

# Requires turnip steps
Dir.glob("spec/steps/**/*.rb").each { |f| load f, true }
