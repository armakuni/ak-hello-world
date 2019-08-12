require 'pathname'

$LOAD_PATH << File.expand_path('../../', __dir__)
require 'api'

begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end

require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require "selenium/webdriver"

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: %w(headless disable-gpu no-sandbox) }
  )

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome

Capybara.configure do |config|
  config.default_driver = :headless_chrome
  config.app_host       = ENV['APP_ENDPOINT']
  config.run_server     = false
end

Capybara.javascript_driver = :headless_chrome
