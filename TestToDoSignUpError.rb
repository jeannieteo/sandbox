require 'selenium-webdriver'

describe 'SignUp fail' do
   
 before(:each) do
 @driver = Selenium::WebDriver.for :firefox
 @base_url = "https://todo-sample-app.herokuapp.com/users/sign_up"
 end
   
 after(:each) do
 @driver.quit
 end
   
 it '1. fail to signup' do
 @driver.get @base_url
 @driver.find_element(id: "user_email").send_keys('')
 @driver.find_element(id: "user_password").send_keys('')
 @driver.find_element(id: "user_password_confirmation").send_keys('')
 @driver.find_element(id: 'new_user').submit
 checkthis = @driver.find_element(id: "error_explanation")
 expect(checkthis.find_element(tag_name: "h2").text).to eq('2 errors prohibited this user from being saved:')
 expect(checkthis.find_element(tag_name: "ul").text).to eq("Email can\'t be blank\nPassword can\'t be blank")
 end

 it '2. fail to signup password confirmation blank' do
 @driver.get @base_url
 @driver.find_element(id: "user_email").send_keys('unique@gmail.com')
 @driver.find_element(id: "user_password").send_keys('12345678')
 @driver.find_element(id: "user_password_confirmation").send_keys('')
 @driver.find_element(id: 'new_user').submit
 checkthis = @driver.find_element(id: "error_explanation")
 expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:') 
 expect(checkthis.find_element(tag_name: "ul").text).to eq("Password confirmation doesn\'t match Password")
 end
   
 it '3. fail to signup password blank' do
 @driver.get @base_url
 @driver.find_element(id: "user_email").send_keys('unique@gmail.com')
 @driver.find_element(id: "user_password").send_keys('')
 @driver.find_element(id: "user_password_confirmation").send_keys('')
 @driver.find_element(id: 'new_user').submit
 checkthis = @driver.find_element(id: "error_explanation")
 expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:')
   expect(checkthis.find_element(tag_name: "ul").text).to eq("Password can\'t be blank")
 
 end
 
 it '4. fail to signup password too short' do
   @driver.get @base_url
   @driver.find_element(id: "user_email").send_keys('teahouse@gmail.com')
   @driver.find_element(id: "user_password").send_keys('1234')
   @driver.find_element(id: "user_password_confirmation").send_keys('1234')
   @driver.find_element(id: 'new_user').submit
   checkthis = @driver.find_element(id: "error_explanation")
   expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:')
   #puts checkthis.find_element(tag_name: "h2").text   
   expect(checkthis.find_element(tag_name: "ul").text).to eq("Password is too short (minimum is 8 characters)")
   #puts checkthis.find_element(tag_name: "ul").text
  end
  
 it '5. fail to signup passwords not matched' do
   @driver.get @base_url
   @driver.find_element(id: "user_email").send_keys('teahouse@gmail.com')
   @driver.find_element(id: "user_password").send_keys('12345678')
   @driver.find_element(id: "user_password_confirmation").send_keys('33335555')
   @driver.find_element(id: 'new_user').submit
   checkthis = @driver.find_element(id: "error_explanation")
   expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:')
   #puts checkthis.find_element(tag_name: "h2").text    
   expect(checkthis.find_element(tag_name: "ul").text).to eq("Password confirmation doesn't match Password")
   #puts checkthis.find_element(tag_name: "ul").text
 end
 
  it '6. fail to signup only password is entered' do
     @driver.get @base_url
     @driver.find_element(id: "user_email").send_keys('')
     @driver.find_element(id: "user_password").send_keys('1234')
     @driver.find_element(id: "user_password_confirmation").send_keys('')
     @driver.find_element(id: 'new_user').submit
     checkthis = @driver.find_element(id: "error_explanation")
     expect(checkthis.find_element(tag_name: "h2").text).to eq('3 errors prohibited this user from being saved:')
     #puts checkthis.find_element(tag_name: "h2").text    
     expect(checkthis.find_element(tag_name: "ul").text).to eq("Email can't be blank\nPassword confirmation doesn't match Password\nPassword is too short (minimum is 8 characters)")
     #puts checkthis.find_element(tag_name: "ul").text
   end
   
  it '7. fail to signup existing user email' do
      @driver.get @base_url
      @driver.find_element(id: "user_email").send_keys('jeannieteo78@gmail.com')
      @driver.find_element(id: "user_password").send_keys('111111111')
      @driver.find_element(id: "user_password_confirmation").send_keys('111111111')
      @driver.find_element(id: 'new_user').submit
      checkthis = @driver.find_element(id: "error_explanation")
      expect(checkthis.find_element(tag_name: "h2").text).to eq('1 error prohibited this user from being saved:')
      #puts checkthis.find_element(tag_name: "h2").text    
      expect(checkthis.find_element(tag_name: "ul").text).to eq("Email has already been taken")
      #puts checkthis.find_element(tag_name: "ul").text
    end
end
