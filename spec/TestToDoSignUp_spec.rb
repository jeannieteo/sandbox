#filename : TestToDoSignup_spec.rb

require "spec_helper"
require_relative "../Signup"
describe 'SignUp' do
 
 before(:each) do
 @Signup = Signup.new(@driver)
 end
  
 it '1. signup ' do
 @Signup.with('new9@user.com', '11111111','11111111' )
 expect(@driver.find_element(class: "notice").text).to eq("Welcome! You have signed up successfully.")
 checkthis = @driver.find_element(class: "alert")
 expect(checkthis.find_element(xpath: "/html/body/div[1]").text).to eq("Hi Friend (new9@user.com),")
 end

 it '2. signup ' do
 @Signup.with('new10@user.com', '11111111','11111111' )
  
  expect(@driver.find_element(class: "notice").text).to eq("Welcome! You have signed up successfully.")
  checkthis = @driver.find_element(class: "alert")
  expect(checkthis.find_element(xpath: "/html/body/div[1]").text).to eq("Hi Friend (new10@user.com),")
  end
end
