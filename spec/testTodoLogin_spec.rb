
# filename: testTodoLogin_spec.rb
require "spec_helper"

EMAIL = {id: 'user_email'}
PASSWORD = {id: 'user_password'}
SUBMIT_USER = {id: 'new_user'}

describe 'login fail' do


#case login fails
 it '1. failed to login-user not signed in' do
  #@driver.get "https://todo-sample-app.herokuapp.com"
  @driver.find_element(EMAIL).send_keys('notauser@fgt')
  @driver.find_element(PASSWORD).send_keys('password')
  @driver.find_element(SUBMIT_USER).submit
  checkthis = @driver.find_element(class: 'alert')
  expect(checkthis.text).to eq('Invalid email or password.')
  #THIS did not work@driver.find_element(class: 'alert').display? should be_true
 end

 it '2. failed to login-no password' do
   #@driver.get ENV['base_url']
   @driver.find_element(EMAIL).send_keys('jeannieteo78@gmail.com')
   @driver.find_element(PASSWORD).send_keys('')
   @driver.find_element(SUBMIT_USER).submit
   checkthis = @driver.find_element(class: 'alert')
   #checkthis.text.should eql('Invalid email or password.')
   expect(checkthis.text).to eq('Invalid email or password.')
 end
 
  it '3. failed to login-no user email' do
   #@driver.get ENV['base_url']
   @driver.find_element(EMAIL).send_keys('')
   @driver.find_element(PASSWORD).send_keys('11111111')
   @driver.find_element(SUBMIT_USER).submit
   checkthis = @driver.find_element(class: 'alert')
   expect(checkthis.text).to eq('Invalid email or password.')
   #checkthis.text.should eql('Invalid email or password.')
   end
   
  it '4. failed to login-wrong password' do
    #@driver.get ENV['base_url']
    @driver.find_element(EMAIL).send_keys('jeannieteo78@gmail.com')
    @driver.find_element(PASSWORD).send_keys('234545656467')
    @driver.find_element(SUBMIT_USER).submit
    checkthis = @driver.find_element(class: 'alert')
    expect(checkthis.text).to eq('Invalid email or password.')
     end
end 

describe 'login pass' do

   it 'login successful' do 
   #@driver.get "https://todo-sample-app.herokuapp.com"
   @driver.find_element(EMAIL).send_keys('jeannieteo78@gmail.com')
   @driver.find_element(PASSWORD).send_keys('12345678')
   @driver.find_element(SUBMIT_USER).submit
   expect(@driver.find_element(class: "notice").text).to eq("Signed in successfully.")
   expect(@driver.find_element(tag_name: "div").text).to eq("Hi Friend (jeannieteo78@gmail.com),")
   expect(@driver.find_element(tag_name: "h2").text).to eq("Your todo list")
   end
   
  it 'click on logout' do 
  #@driver.get ENV['base_url']
  @driver.find_element(EMAIL).send_keys('jeannieteo@gmail.com')
  @driver.find_element(PASSWORD).send_keys('11111111')
  @driver.find_element(SUBMIT_USER).submit
  expect(@driver.find_element(class: "notice").text).to eq("Signed in successfully.")
  expect(@driver.find_element(tag_name: "div").text).to eq("Hi Friend (jeannieteo@gmail.com),")
  @driver.find_element(:link, "Logout").click
  expect(@driver.find_element(tag_name: "h2").text).to eql("Log in")
  end
   
  it 'click on New Task' do 
    #@driver.get ENV['base_url']
    @driver.find_element(EMAIL).send_keys('jeannieteo@gmail.com')
    @driver.find_element(PASSWORD).send_keys('11111111')
    @driver.find_element(SUBMIT_USER).submit
    expect(@driver.find_element(class: "notice").text).to eq("Signed in successfully.")
    expect(@driver.find_element(tag_name: "div").text).to eq("Hi Friend (jeannieteo@gmail.com),")
    @driver.find_element(:link, "New Task").click
    @wait.until { expect(@driver.find_element(tag_name: "h1").text).to eq("New task") }
    expect(@driver.find_element(tag_name: "div").text).to eq("Hi Friend (jeannieteo@gmail.com),")
    end
end
