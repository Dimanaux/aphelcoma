require "selenium-webdriver"

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { "w3c" => false, args: %w[disable-gpu window-size=1920,1080] })
  client = Selenium::WebDriver::Remote::Http::Default.new

  Capybara::Selenium::Driver.new app,
    browser: :chrome,
    http_client: client,
    desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome
