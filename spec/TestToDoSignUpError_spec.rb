#filename : TestToDoSignUpError_spec.rb

#require "spec_helper"
require 'selenium-webdriver'
require_relative "../Signup"

describe 'SignUp_errors' do
 
 before(:each) do
 @driver = Selenium::WebDriver.for :firefox
 @Signup = Signup.new(@driver)
 end

 after(:each) do
 @driver.quit
 end

   
it '1. fail to signup - ALL BLANK' do
   @Signup.with('', '','' )
   checkthis = @driver.find_element(id: "error_explanation")
   expect(checkthis.find_element(tag_name: "h2").text).to eq('2 errors prohibited this user from being saved:')
   expect(checkthis.find_element(tag_name: "ul").text).to eq("Email can\'t be blank\nPassword can\'t be blank")
 end

 it '2. fail to signup -password confirmation blank' do
 	@Signup.with('unique@gmail.com', '12345678','' )
    checkthis = @driver.find_element(id: "error_explanation")
 	expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:') 
 	expect(checkthis.find_element(tag_name: "ul").text).to eq("Password confirmation doesn\'t match Password")
 end

it '3. fail to signup -password blank' do
 	@Signup.with('unique@gmail.com', '','' )
    checkthis = @driver.find_element(id: "error_explanation")
 	expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:')
   	expect(checkthis.find_element(tag_name: "ul").text).to eq("Password can\'t be blank")
 end

 it '4. fail to signup - password too short' do
 	@Signup.with('TEAHOUSE@gmail.com', '1224','1224' )
    checkthis = @driver.find_element(id: "error_explanation")
   	expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:')
   	#puts checkthis.find_element(tag_name: "h2").text   
   	expect(checkthis.find_element(tag_name: "ul").text).to eq("Password is too short (minimum is 8 characters)")
   	#puts checkthis.find_element(tag_name: "ul").text
 end

 it '5. fail to signup - passwords not matched' do
 	@Signup.with('TEAHOUSE@gmail.com', '12245678','12246666' )
    checkthis = @driver.find_element(id: "error_explanation")
   	expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:')
   	#puts checkthis.find_element(tag_name: "h2").text    
   	expect(checkthis.find_element(tag_name: "ul").text).to eq("Password confirmation doesn't match Password")
   	#puts checkthis.find_element(tag_name: "ul").text
 end

  it '6. fail to signup - only password is entered' do
 	@Signup.with('', '1234','' )
	checkthis = @driver.find_element(id: "error_explanation")
    expect(checkthis.find_element(tag_name: "h2").text).to eq('3 errors prohibited this user from being saved:')
    #puts checkthis.find_element(tag_name: "h2").text    
    expect(checkthis.find_element(tag_name: "ul").text).to eq("Email can't be blank\nPassword confirmation doesn't match Password\nPassword is too short (minimum is 8 characters)")
    #puts checkthis.find_element(tag_name: "ul").text
 end

  it '7. fail to signup existing user email' do
 	@Signup.with('jeannieteo78@gmail.com', '11111111','11111111' )
    checkthis = @driver.find_element(id: "error_explanation")
    expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:')
    #puts checkthis.find_element(tag_name: "h2").text    
    expect(checkthis.find_element(tag_name: "ul").text).to eq("Email has already been taken")
    #puts checkthis.find_element(tag_name: "ul").tex
 end
end
