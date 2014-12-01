require 'selenium-webdriver'

describe 'edit first task' do
   
   before(:each) do
     @driver = Selenium::WebDriver.for :firefox
     @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
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
    if taskcount == 0
      puts "add a task please"
    else
      puts "there are " + taskcount.to_s + "tasks"
      #first save the task description for checking later (first task)
      stringtocompare = @driver.find_element(xpath: "html/body/table[1]/tbody/tr[1]/td[2]").text 
      #click on edit of the first task
      puts "click on first task's edit link"
    
      @driver.find_element(xpath: "html/body/table[1]/tbody/tr[1]/td[4]/a").click 
      #wait until the page load because the script failed here
      @wait.until { expect(@driver.find_element(tag_name: "h1").text).to eq("Editing task") }
      #check that textbox is showing the correct task
      checkthis = @driver.find_element(id: "task_description")
      expect(checkthis.attribute("value")).to eq(stringtocompare) 
    
      #add  "I added" to the task description
      checkthis.send_keys(" I added")
      @driver.find_element(class: "actions").submit
      # check that tasklists shows the correct edited task
      editstring = @driver.find_element(xpath: "html/body/table[1]/tbody/tr[" + taskcount.to_s + "]/td[2]").text
      expect(editstring).to eq(stringtocompare + " I added") 
    end
    
 end
   
end
