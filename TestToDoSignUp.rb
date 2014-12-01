require 'selenium-webdriver'

describe 'SignUp success' do
   
 before(:each) do
 @driver = Selenium::WebDriver.for :firefox
 end
   
 after(:each) do
 @driver.quit
 end
   
 it '1. signup teahouse@yahoo.com' do
 @driver.get 'https://todo-sample-app.herokuapp.com/users/sign_up'
 @driver.find_element(id: "user_email").send_keys('teahouse@yahoo.com')
 @driver.find_element(id: "user_password").send_keys('11111111')
 @driver.find_element(id: "user_password_confirmation").send_keys('11111111')
 @driver.find_element(id: 'new_user').submit
 expect(@driver.find_element(class: "notice").text).to eq("Welcome! You have signed up successfully.")
 checkthis = @driver.find_element(class: "alert")
 checkthis.find_element(tag_name: "div").text.should eql("Hi Friend (teahouse@yahoo.com),")
 end

 it '2. signup theonetoplay@gmail.com' do
  @driver.get 'https://todo-sample-app.herokuapp.com/users/sign_up'
  @driver.find_element(id: "user_email").send_keys('theonetoplay@gmail.com')
  @driver.find_element(id: "user_password").send_keys('11111111')
  @driver.find_element(id: "user_password_confirmation").send_keys('11111111')
  @driver.find_element(id: 'new_user').submit
  @driver.find_element(class: "notice").text.should eql("Welcome! You have signed up successfully.")
  checkthis = @driver.find_element(class: "alert")
  checkthis.find_element(tag_name: "div").text.should eql("Hi Friend (theonetoplay@gmail.com),")
  end
end
