class Signup
 
 EMAIL = { id: "user_email" }
 PASSWORD = { id: "user_password" }
 PASSWORD_CONFIRM = { id: "user_password_confirmation" }
 USER_SUBMIT = {id: 'new_user'}

 
 def initialize(driver)
 @driver = driver
 @driver.get "https://todo-sample-app.herokuapp.com/users/sign_up"
 end

 def with(useremail, password, password_confirm)
 @driver.find_element(EMAIL).send_keys(useremail)
 @driver.find_element(PASSWORD).send_keys(password)
 @driver.find_element(PASSWORD_CONFIRM).send_keys(password_confirm)
 @driver.find_element(USER_SUBMIT).submit
 end

end