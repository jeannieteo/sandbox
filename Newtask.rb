# filename : Newtask.rb
class Newtask
 TASK_DESCRIPTION = {id: 'task_description'}
 SUBMIT_NEWTASK = {id: 'new_task'}
 
 def initialize(driver)
  @driver = driver
  @driver.get "https://todo-sample-app.herokuapp.com/tasks/new"
 end

 def with(task_description)
	#@driver.find_element(:link, "New Task").click
    #@wait.until { expect(@driver.find_element(tag_name: "h1").text).to eq("New task") }
    @driver.find_element(TASK_DESCRIPTION).send_keys(task_description)
    @driver.find_element(SUBMIT_NEWTASK).submit
 end
end
