#filename : TestToDoSignup_spec.rb

require "spec_helper"
require_relative "../Signup"
describe 'SignUp' do
 
 before(:each) do
 @Signup = Signup.new(@driver)
 end
  
 it '1. signup ' do
 @Signup.with('new@user.com', '11111111','11111111' )
 expect(@driver.find_element(class: "notice").text).to eq("Welcome! You have signed up successfully.")
 checkthis = @driver.find_element(class: "alert")
 expect(checkthis.find_element(tag_name: "div").text).to eq("Hi Friend (new@user),")
 end

 it '2. signup ' do
 @Signup.with('new1@user.com', '11111111','11111111' )
  
  expect(@driver.find_element(class: "notice").text).to eq("Welcome! You have signed up successfully.")
  checkthis = @driver.find_element(class: "alert")
  expect(checkthis.find_element(tag_name: "div").text).to eq("Hi Friend (new1@user),")
  end
end
