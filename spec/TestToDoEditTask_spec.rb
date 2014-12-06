#filename : TestToDoEditTask_spec.rb

require "spec_helper"
require_relative "../Login"
EDIT_LINK = {xpath: "html/body/table[1]/tbody/tr[1]/td[4]/a"}
EDIT_DONE_LINK = {xpath: "html/body/table[2]/tbody/tr[1]/td[4]/a"}
TASK_STRING = {xpath: "html/body/table[1]/tbody/tr[1]/td[2]"}
TASK_DONE_STRING = {xpath: "html/body/table[2]/tbody/tr[1]/td[2]"}
TASK_TABLE = {xpath: "html/body/table[1]/tbody/tr"}
DONE_TABLE = {xpath: "html/body/table[2]/tbody/tr"}
describe 'edit first task' do


   before(:each) do
     @Login = Login.new(@driver)
     @Login.with('jeannieteo78@gmail.com', '12345678')
     @taskcount = @driver.find_elements(TASK_TABLE).size
     @donecount = @driver.find_elements(DONE_TABLE).size
     puts "there are " + @taskcount.to_s + " tasks and " + @donecount.to_s + " done tasks."
   end
     
  it 'EDIT first task for all tasks' do 
    if @taskcount == 0
      puts "add a task please, there are no tasks to edit"
    else
      for i in 1..@taskcount
        #first save the task description for checking later (first task)
        stringtocompare = @driver.find_element(TASK_STRING).text 
        #click on edit of the first task
        @driver.find_element(EDIT_LINK).click 
        #wait until the page load because the script failed here
        @wait.until { expect(@driver.find_element(tag_name: "h1").text).to eq("Editing task") }
        #check that textbox is showing the correct task
        checkthis = @driver.find_element(id: "task_description")
        expect(checkthis.attribute("value")).to eq(stringtocompare) 
        #add  "I added" to the task description
        checkthis.send_keys("-I edited")
        @driver.find_element(class: "actions").submit
        # check that tasklists shows the correct edited task
        editstring = @driver.find_element(xpath: "html/body/table[1]/tbody/tr[" + @taskcount.to_s + "]/td[2]").text
        expect(editstring).to eq(stringtocompare + "-I edited") 
      end
    end
    
 end

it 'EDIT first done task for all tasks' do 
    if @donecount == 0
      puts "add a task please, there are no tasks to edit"
    else
      for i in 1..@donecount
        #first save the task description for checking later (first task)
        stringtocompare = @driver.find_element(TASK_DONE_STRING).text 
        #click on edit of the first task
        @driver.find_element(EDIT_DONE_LINK).click 
        #wait until the page load because the script failed here
        @wait.until { expect(@driver.find_element(tag_name: "h1").text).to eq("Editing task") }
        #check that textbox is showing the correct task
        checkthis = @driver.find_element(id: "task_description")
        expect(checkthis.attribute("value")).to eq(stringtocompare) 
        #add  "I added" to the task description
        checkthis.send_keys("-I edited")
        @driver.find_element(class: "actions").submit
        # check that tasklists shows the correct edited task
        editstring = @driver.find_element(xpath: "html/body/table[2]/tbody/tr[" + @donecount.to_s + "]/td[2]").text
        expect(editstring).to eq(stringtocompare + "-I edited") 
      end
    end
    
 end 
end
