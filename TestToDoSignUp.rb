require 'selenium-webdriver'

describe 'SignUp success' do
   
 before(:each) do
 @driver = Selenium::WebDriver.for :firefox
 end
   
 after(:each) do
 @driver.quit
 end
   
 it '1. signup ' do
 @driver.get 'https://todo-sample-app.herokuapp.com/users/sign_up'
 @driver.find_element(id: "user_email").send_keys('new@user')
 @driver.find_element(id: "user_password").send_keys('11111111')
 @driver.find_element(id: "user_password_confirmation").send_keys('11111111')
 @driver.find_element(id: 'new_user').submit
 expect(@driver.find_element(class: "notice").text).to eq("Welcome! You have signed up successfully.")
 checkthis = @driver.find_element(class: "alert")
 expect(checkthis.find_element(tag_name: "div").text).to eq("Hi Friend (new@user),")
 end

 it '2. signup ' do
  @driver.get 'https://todo-sample-app.herokuapp.com/users/sign_up'
  @driver.find_element(id: "user_email").send_keys('new1@user')
  @driver.find_element(id: "user_password").send_keys('11111111')
  @driver.find_element(id: "user_password_confirmation").send_keys('11111111')
  @driver.find_element(id: 'new_user').submit
  expect(@driver.find_element(class: "notice").text).to eq("Welcome! You have signed up successfully.")
  checkthis = @driver.find_element(class: "alert")
  expect(checkthis.find_element(tag_name: "div").text).to eq("Hi Friend (new1@user),")
  end
end
