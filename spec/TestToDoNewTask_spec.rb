
#filename : TestToDoNewTask.rb
require "spec_helper"
require_relative "../Login"
require_relative "../Newtask"

describe 'add new task' do
     
   before(:each) do
     @Login = Login.new(@driver)
     @Login.with('jeannieteo78@gmail.com', '12345678')
     @taskcount = @driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size
     @newtask = Newtask.new(@driver)
   end

 it '1-put in more than 100 chars in new task' do 
    @newtask.with('X1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111')
    #expect the add new task to fail
    puts "\nexpect the add new task to fail since more than 100 chars"
    expect(@driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size).to eq(@taskcount)
  end
   
  it '2-put in  0 chars' do 
     @newtask.with('')
     #expect the add new task to fail
     puts "\nexpect the add new task to fail since 0 chars"
     expect(@driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size).to eq(@taskcount)
   end
   
  it '3-put in new Task' do 
    @newtask.with('GET potatoes')
    @taskcount += 1 
    expect(@driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size).to eq(@taskcount)
    expect(@driver.find_element(xpath: "html/body/table[1]/tbody/tr[" + @taskcount.to_s + "]/td[2]").text).to eq('GET potatoes')
  end
  
  it '4-put in another new Task' do 
     @newtask.with('Get Vegetables')
     @taskcount += 1 
     expect(@driver.find_elements(xpath: "html/body/table[1]/tbody/tr").size).to eq(@taskcount)
     expect(@driver.find_element(xpath: "html/body/table[1]/tbody/tr[" + @taskcount.to_s + "]/td[2]").text).to eq('Get Vegetables')
   end
end
# add duplicate task is allowed