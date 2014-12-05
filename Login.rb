#filename : Login.rb
class Login
 EMAIL = {id: 'user_email'}
 PASSWORD = {id: 'user_password'}
 SUBMIT_USER = {id: 'new_user'}

 
 def initialize(driver)
  @driver = driver
  @driver.get "https://todo-sample-app.herokuapp.com"
 end

 def with(login_email, login_password)
  @driver.find_element(EMAIL).send_keys(login_email)
  @driver.find_element(PASSWORD).send_keys(login_password)
  @driver.find_element(SUBMIT_USER).submit
 end
end