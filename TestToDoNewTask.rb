require 'selenium-webdriver'

describe 'add new task' do
     
   before(:each) do
   @driver = Selenium::WebDriver.for :firefox
   @base_url = "https://todo-sample-app.herokuapp.com"
   @driver.get @base_url
   @driver.find_element(id: 'user_email').send_keys('jeannieteo78@gmail.com')
   @driver.find_element(id: 'user_password').send_keys('12345678')
   @driver.find_element(id: 'new_user').submit
   @driver.find_element(:link, "New Task").click
   end
     
   after(:each) do
   #@driver.quit
   end

   it 'put in more than 100 chars' do 
     @driver.find_element(id: 'task_description').send_keys('X1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111')
     @driver.find_element(id: 'new_task').submit
   end
  
end
