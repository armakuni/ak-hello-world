require 'pathname'

$LOAD_PATH << File.expand_path('../../', __dir__)
require 'api'

begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end

require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require "selenium/webdriver"

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.load_selenium
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << '--headless'
    opts.args << '--disable-gpu'
    opts.args << '--no-sandbox'
    opts.args << '--disable-site-isolation-trials'
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

def app_endpoint
  ENV.fetch('APP_ENDPOINT')
end

Capybara.javascript_driver = :headless_chrome

Capybara.configure do |config|
  config.default_driver = :headless_chrome
  config.app_host       = app_endpoint
end
