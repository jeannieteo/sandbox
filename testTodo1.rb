require 'selenium-webdriver'
#RSPEC testTodo.rb to run this
describe 'Login' do
   
 before(:each) do
 @driver = Selenium::WebDriver.for :firefox
 end
   
 after(:each) do
 @driver.quit
 end
 
#case login
 it 'failed to login because of email is not signed up' do
 @driver.get 'https://todo-sample-app.herokuapp.com'
 @driver.find_element(id: 'user_email').send_keys('notauser@fgt')
 @driver.find_element(id: 'user_password').send_keys('password')
 @driver.find_element(id: 'new_user').submit
 checkthis = @driver.find_element(class: 'alert')
 checkthis.text.should eql('Invalid email or password.')
 #THIS did not work@driver.find_element(class: 'alert').display? should be_true
 
 end
end
