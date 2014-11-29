require 'selenium-webdriver'

describe 'login fail' do
   
 before(:each) do
 @driver = Selenium::WebDriver.for :firefox
 @base_url = "https://todo-sample-app.herokuapp.com"
 end
   
 after(:each) do
 @driver.quit
 end
   
#case login fails
 it '1. failed to login-user not signed in' do
 @driver.get @base_url
 @driver.find_element(id: 'user_email').send_keys('notauser@fgt')
 @driver.find_element(id: 'user_password').send_keys('password')
 @driver.find_element(id: 'new_user').submit
 checkthis = @driver.find_element(class: 'alert')
 checkthis.text.should eql('Invalid email or password.')
 #THIS did not work@driver.find_element(class: 'alert').display? should be_true
 end

 it '2. failed to login-no password' do
 @driver.get @base_url
 @driver.find_element(id: 'user_email').send_keys('jeannieteo78@gmail.com')
 @driver.find_element(id: 'user_password').send_keys('')
 @driver.find_element(id: 'new_user').submit
 checkthis = @driver.find_element(class: 'alert')
 checkthis.text.should eql('Invalid email or password.')
 end
 
  it '3. failed to login-no user email' do
   @driver.get @base_url
   @driver.find_element(id: 'user_email').send_keys('')
   @driver.find_element(id: 'user_password').send_keys('11111111')
   @driver.find_element(id: 'new_user').submit
   checkthis = @driver.find_element(class: 'alert')
   checkthis.text.should eql('Invalid email or password.')
   end
   
  it '4. failed to login-wrong password' do
    @driver.get @base_url
    @driver.find_element(id: 'user_email').send_keys('jeannieteo78@gmail.com')
    @driver.find_element(id: 'user_password').send_keys('234545656467')
    @driver.find_element(id: 'new_user').submit
    checkthis = @driver.find_element(class: 'alert')
    checkthis.text.should eql('Invalid email or password.')
     end
end 

describe 'login pass' do
     
   before(:each) do
   @driver = Selenium::WebDriver.for :firefox
   @base_url = "https://todo-sample-app.herokuapp.com"
   end
     
   after(:each) do
   @driver.quit
   end

   it 'login successful' do 
   @driver.get @base_url
   @driver.find_element(id: 'user_email').send_keys('jeannieteo78@gmail.com')
   @driver.find_element(id: 'user_password').send_keys('12345678')
   @driver.find_element(id: 'new_user').submit
   @driver.find_element(class: "notice").text.should eql("Signed in successfully.")
   @driver.find_element(tag_name: "div").text.should eql("Hi Friend (jeannieteo78@gmail.com),")
   @driver.find_element(tag_name: "h2").text.should eql("Your todo list")
   end
   
  it 'click on logout' do 
  @driver.get @base_url
  @driver.find_element(id: 'user_email').send_keys('jeannieteo@gmail.com')
  @driver.find_element(id: 'user_password').send_keys('11111111')
  @driver.find_element(id: 'new_user').submit
  @driver.find_element(class: "notice").text.should eql("Signed in successfully.")
  @driver.find_element(tag_name: "div").text.should eql("Hi Friend (jeannieteo@gmail.com),")
  @driver.find_element(:link, "Logout").click
  @driver.find_element(tag_name: "div").text.should eql("log out successful")
   end
   
  it 'click on New Task' do 
    @driver.get @base_url
    @driver.find_element(id: 'user_email').send_keys('jeannieteo@gmail.com')
    @driver.find_element(id: 'user_password').send_keys('11111111')
    @driver.find_element(id: 'new_user').submit
    @driver.find_element(class: "notice").text.should eql("Signed in successfully.")
    @driver.find_element(tag_name: "div").text.should eql("Hi Friend (jeannieteo@gmail.com),")
    @driver.find_element(:link, "New Task").click
    @driver.find_element(tag_name: "div").text.should eql("Hi Friend (jeannieteo@gmail.com),")
    @driver.find_element(tag_name: "h1").text.should eql("New Task")  
     end
end
