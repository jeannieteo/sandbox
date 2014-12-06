# filename : TestToDoChecktask_spec.rb

require "spec_helper"
require_relative "../Login"

describe 'check task' do


 TASK_TABLE = {xpath: "html/body/table[1]/tbody/tr"}
 DONE_TABLE = {xpath: "html/body/table[2]/tbody/tr"}
   before(:each) do
     @Login = Login.new(@driver)
     @Login.with('jeannieteo78@gmail.com', '12345678')
     @taskcount = @driver.find_elements(TASK_TABLE).size
     @donecount = @driver.find_elements(DONE_TABLE).size
     puts "there are " + @taskcount.to_s + " tasks."
     puts "there are " + @donecount.to_s + " tasks."
   end
     
  it 'check all tasks' do 
    
    if @taskcount == 0
      puts "\nadd a task please, there are no task to check"
    else

        for i in 1..@taskcount
        	puts "\ncheck" + i.to_s + " task"
   			@driver.find_element(xpath: "html/body/table[1]/tbody/tr[1]/td[1]/form/span/input[2]").click
   			numOftask = @driver.find_elements(TASK_TABLE).size
   			numOfdone = @driver.find_elements(DONE_TABLE).size
   			puts numOftask.to_s + " tasks and " + numOfdone.to_s + " done tasks."
   			expect(numOftask).to eq(@taskcount -i)
   			expect(numOfdone).to eq(@donecount +i)
		end
    end

  end  

 it 'uncheck all done tasks' do 
    
    if @donecount == 0
      puts "add a done task please, there are no task to uncheck"
    else
      
        for i in 1..@donecount
        	puts "\nuncheck" + i.to_s + " done task"
   			@driver.find_element(xpath: "html/body/table[2]/tbody/tr[1]/td[1]/form/span/input[2]").click
   			numOftask = @driver.find_elements(TASK_TABLE).size
   			numOfdone = @driver.find_elements(DONE_TABLE).size
   			puts numOftask.to_s + " tasks and " + numOfdone.to_s + " done tasks."
   			expect(numOftask).to eq(@taskcount +i)
   			expect(numOfdone).to eq(@donecount -i)
		end
    end

  end  

end
