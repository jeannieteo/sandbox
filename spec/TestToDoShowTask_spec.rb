#filename : TestToDoShowTask_spec.rb

require "spec_helper"
require_relative "../Login"
SHOW_LINK1 = "html/body/table[1]/tbody/tr["
SHOW_LINK2 = "]/td[3]/a"
SHOW_DONE_LINK1 = "html/body/table[2]/tbody/tr["
TASK_STRING1 = "html/body/table[1]/tbody/tr["
TASK_STRING2 = "]/td[2]"
TASK_DONE_STRING1 = "html/body/table[2]/tbody/tr["
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
     
  it 'click on SHOW for all todo tasks' do 
    if @taskcount == 0
      puts "add a task please, there are no tasks to show"
    else
      for i in 1..@taskcount
        #first save the task description for checking later (first task)
        stringtocompare = @driver.find_element(xpath: TASK_STRING1 + i.to_s + TASK_STRING2).text
        
        @driver.find_element(xpath: SHOW_LINK1 + i.to_s + SHOW_LINK2).click
        @wait.until { expect(@driver.find_element(xpath: "html/body/p[4]/strong").text).to eq("Task Details:") }
        #check task string is correct
        expect(@driver.find_element(xpath: "html/body/p[4]").text).to eq("Task Details: " + stringtocompare)
        #check checkbox is not ticked
        checkthis = @driver.find_element(id: "Done")
        expect(checkthis.attribute("value")).to eq("false")
        @driver.find_element(:link, "Back").click
        @wait.until { expect(@driver.find_element(tag_name: "h2").text).to eq("Your todo list") }
      end
    end
    
   end

 it 'click on SHOW for all done tasks' do 
    if @donecount == 0
      puts "add a task please, there are no done tasks to show"
    else
      for i in 1..@donecount
        #first save the task description for checking later
        stringtocompare = @driver.find_element(xpath: TASK_DONE_STRING1 + i.to_s + TASK_STRING2).text
        
        @driver.find_element(xpath: SHOW_DONE_LINK1 + i.to_s + SHOW_LINK2).click
        @wait.until { expect(@driver.find_element(xpath: "html/body/p[4]/strong").text).to eq("Task Details:") }
        #check task string is correct
        expect(@driver.find_element(xpath: "html/body/p[4]").text).to eq("Task Details: " + stringtocompare)
        #check checkbox is ticked
        checkthis = @driver.find_element(id: "Done")
        expect(checkthis.attribute("value")).to eq("true")
        @driver.find_element(:link, "Back").click
        @wait.until { expect(@driver.find_element(tag_name: "h2").text).to eq("Your todo list") }
      end
    end
    
   end
end