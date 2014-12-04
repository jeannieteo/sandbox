
# filename: spec_helper.rb
require 'selenium-webdriver'
RSpec.configure do |config|
 
  config.before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
    @base_url = "https://todo-sample-app.herokuapp.com"
    @driver.get @base_url
  end
 
  config.after(:each) do
    @driver.quit
  end
 
end