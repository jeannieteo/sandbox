
# filename: testTodoLogin_spec.rb
require "spec_helper"
require_relative "../Login"

describe 'login fail' do

  before(:each) do
  @Login = Login.new(@driver)
  end

  #case login fails
 it '1. failed to login-user not signed in' do
   @Login.with('notauser@fgt', 'password')
   checkthis = @driver.find_element(class: 'alert')
   expect(checkthis.text).to eq('Invalid email or password.')
 end

 it '2. failed to login-no password' do
   @Login.with('jeannieteo78@gmail.com', '')
   checkthis = @driver.find_element(class: 'alert')
   expect(checkthis.text).to eq('Invalid email or password.')
 end
 
  it '3. failed to login-no user email' do
   @Login.with('', '11111111')
   checkthis = @driver.find_element(class: 'alert')
   expect(checkthis.text).to eq('Invalid email or password.')
   end
   
  it '4. failed to login-wrong password' do
    @Login.with('jeannieteo78@gmail.com', '234545656467')
    checkthis = @driver.find_element(class: 'alert')
    expect(checkthis.text).to eq('Invalid email or password.')
    end
end 

describe 'login pass' do

  before(:each) do
  @Login = Login.new(@driver)
  end

   it '1. login successful' do 
   @Login.with('jeannieteo78@gmail.com', '12345678')
   expect(@driver.find_element(class: "notice").text).to eq("Signed in successfully.")
   expect(@driver.find_element(tag_name: "div").text).to eq("Hi Friend (jeannieteo78@gmail.com),")
   expect(@driver.find_element(tag_name: "h2").text).to eq("Your todo list")
   end
   
  it '2. click on logout' do 
  @Login.with('jeannieteo@gmail.com', '11111111')
  expect(@driver.find_element(class: "notice").text).to eq("Signed in successfully.")
  expect(@driver.find_element(tag_name: "div").text).to eq("Hi Friend (jeannieteo@gmail.com),")
  @driver.find_element(:link, "Logout").click
  expect(@driver.find_element(tag_name: "h2").text).to eql("Log in")
  end
   
  it '3. click on New Task' do 
    @Login.with('jeannieteo@gmail.com', '11111111')
    expect(@driver.find_element(class: "notice").text).to eq("Signed in successfully.")
    expect(@driver.find_element(tag_name: "div").text).to eq("Hi Friend (jeannieteo@gmail.com),")
    @driver.find_element(:link, "New Task").click
    @wait.until { expect(@driver.find_element(tag_name: "h1").text).to eq("New task") }
    expect(@driver.find_element(tag_name: "div").text).to eq("Hi Friend (jeannieteo@gmail.com),")
    end
end
