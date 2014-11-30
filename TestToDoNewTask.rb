require 'selenium-webdriver'

describe 'add new task' do
     
   before(:each) do
     @driver = Selenium::WebDriver.for :firefox
     @base_url = "https://todo-sample-app.herokuapp.com"
     @driver.get @base_url
   
   end
     
   after(:each) do
     @driver.quit
   end

 it 'put in more than 100 chars in new task' do 
    @driver.find_element(id: 'user_email').send_keys('jeannieteo78@gmail.com')
    @driver.find_element(id: 'user_password').send_keys('12345678')
    @driver.find_element(id: 'new_user').submit
    taskcount = @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size
    @driver.find_element(:link, "New Task").click
    @driver.find_element(id: 'task_description').send_keys('X1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111')
    @driver.find_element(id: 'new_task').submit
     #expect the new task to fail
    @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size.should == taskcount

  end
   
  it 'put in  0 chars' do 
     @driver.find_element(id: 'user_email').send_keys('jeannieteo78@gmail.com')
     @driver.find_element(id: 'user_password').send_keys('12345678')
     @driver.find_element(id: 'new_user').submit
     taskcount = @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size
     @driver.find_element(:link, "New Task").click
     @driver.find_element(id: 'task_description').send_keys('')
     @driver.find_element(id: 'new_task').submit
     #expect the new task to fail
     @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size.should == taskcount
   end
   
  it 'put in new Task' do 
    @driver.find_element(id: 'user_email').send_keys('jeannieteo78@gmail.com')
    @driver.find_element(id: 'user_password').send_keys('12345678')
    @driver.find_element(id: 'new_user').submit
    taskcount = @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size
    @driver.find_element(:link, "New Task").click
    @driver.find_element(id: 'task_description').send_keys('Get potatoes')
    @driver.find_element(id: 'new_task').submit
    taskcount += 1 
    @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size.should == taskcount
    @driver.find_element(xpath: "html/body/table[1]/tbody/tr[" + taskcount.to_s + "]/td[2]").text.should eq('Get potatoes')
  end
  
  it 'put in another new Task' do 
     @driver.find_element(id: 'user_email').send_keys('jeannieteo@gmail.com')
     @driver.find_element(id: 'user_password').send_keys('11111111')
     @driver.find_element(id: 'new_user').submit
     taskcount = @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size
     @driver.find_element(:link, "New Task").click
     @driver.find_element(id: 'task_description').send_keys('Destroy Task is not working.')
     @driver.find_element(id: 'new_task').submit
     taskcount += 1 
     @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size.should == taskcount
     @driver.find_element(xpath: "html/body/table[1]/tbody/tr[" + taskcount.to_s + "]/td[2]").text.should eq('Destroy Task is not working.')
   end
end
