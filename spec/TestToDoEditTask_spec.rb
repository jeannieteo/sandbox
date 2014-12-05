#filename : TestToDoEditTask_spec.rb

require "spec_helper"
require_relative "../Login"
EDIT_LINK = {xpath: "html/body/table[1]/tbody/tr[1]/td[4]/a"}
TASK_STRING = {xpath: "html/body/table[1]/tbody/tr[1]/td[2]"}

describe 'edit first task' do


   before(:each) do
     @Login = Login.new(@driver)
     @Login.with('jeannieteo78@gmail.com', '12345678')
   end
     
  it 'click on edit to edit task' do 
    
    taskcount = @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size
    if taskcount == 0
      puts "add a task please"
    else
      puts "there are " + taskcount.to_s + "tasks"
      #first save the task description for checking later (first task)
      stringtocompare = @driver.find_element(TASK_STRING).text 
      #click on edit of the first task
      puts "click on first task's edit link"
    
      @driver.find_element(EDIT_LINK).click 
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
