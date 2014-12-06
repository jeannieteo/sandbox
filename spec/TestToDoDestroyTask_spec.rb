#filename : TestToDoEditTask_spec.rb

require "spec_helper"
require_relative "../Login"

describe 'delete tasks' do

DESTROY_LINK = {xpath: "html/body/table[1]/tbody/tr[1]/td[5]/a"}
DESTROY_DONE_LINK = {xpath: "html/body/table[2]/tbody/tr[1]/td[5]/a"}
TASK_TABLE = {xpath: "html/body/table[1]/tbody/tr"}
DONE_TABLE = {xpath: "html/body/table[2]/tbody/tr"}

   before(:each) do
     @Login = Login.new(@driver)
     @Login.with('jeannieteo78@gmail.com', '12345678')
     @taskcount = @driver.find_elements(TASK_TABLE).size
     @donecount = @driver.find_elements(DONE_TABLE).size
     puts "there are " + @taskcount.to_s + " tasks and " + @donecount.to_s + " done tasks."
   end
     
  it '1. DELETE first task -  OK' do 
    
    if @taskcount == 0
      puts "add a task please, there are no task to delete"
    else
      @driver.find_element(DESTROY_LINK).click 
      alert = @driver.switch_to.alert
      expect(alert.text).to eq('Are you sure?')
      alert.accept
      expect(@driver.find_elements(TASK_TABLE).size).to eq(@taskcount-1)
    end
    
 end

  it '2. DELETE first task - then cancel' do 
    
    if @taskcount == 0
      puts "add a task please, there are no task to delete"
    else
      @driver.find_element(DESTROY_LINK).click 
      alert = @driver.switch_to.alert
      expect(alert.text).to eq('Are you sure?')
      alert.dismiss 
      expect(@driver.find_elements(TASK_TABLE).size).to eq(@taskcount)
    end
    
 end  

 it '3. DELETE first done task -  OK' do 
    
    if @donecount == 0
      puts "add a done task please, there are no done task to delete"
    else
      @driver.find_element(DESTROY_DONE_LINK).click 
      alert = @driver.switch_to.alert
      expect(alert.text).to eq('Are you sure?')
      alert.accept
      expect(@driver.find_elements(DONE_TABLE).size).to eq(@donecount-1)
    end
    
 end

  it '4. DELETE first done task - then cancel' do 
    
    if @donecount == 0
      puts "add a done task please, there are no done task to delete"
    else
      @driver.find_element(DESTROY_DONE_LINK).click 
      alert = @driver.switch_to.alert
      expect(alert.text).to eq('Are you sure?')
      alert.dismiss 
      expect(@driver.find_elements(DONE_TABLE).size).to eq(@donecount)
    end
    
 end  
end
