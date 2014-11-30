require 'selenium-webdriver'

describe 'add new task' do
   
   before(:each) do
     @driver = Selenium::WebDriver.for :firefox
     @base_url = "https://todo-sample-app.herokuapp.com"
     @driver.get @base_url
     @driver.find_element(id: 'user_email').send_keys('jeannieteo@gmail.com')
     @driver.find_element(id: 'user_password').send_keys('11111111')
     @driver.find_element(id: 'new_user').submit
   end
     
   after(:each) do
     @driver.quit
   end

 it 'click on edit to edit task' do 
   
   taskcount = @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size
   puts "there are " + taskcount.to_s + "tasks"
   #first save the task description for checking later (first task)
   stringtocompare = @driver.find_element(xpath: "html/body/table[1]/tbody/tr[1]/td[2]").text 
   #click on edit of the first task
   @driver.find_element(xpath: "html/body/table[1]/tbody/tr[1]/td[4]/a").click
   # check that textbox is showing the correct task
   checkthis = @driver.find_element(id: "task_description")
   checkthis.attribute("value").should eql(stringtocompare) 
   #add  I added to the task description
   checkthis.send_keys(" I added")
   @driver.find_element(class: "actions").submit
   # check that tasklists shows the correct edited task
   editstring = @driver.find_element(xpath: "html/body/table[1]/tbody/tr[" + taskcount.to_s + "]/td[2]").text
   editstring.should eql(stringtocompare + " I added") 
  end

end
