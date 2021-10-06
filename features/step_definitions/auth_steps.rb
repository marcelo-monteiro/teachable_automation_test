Given('I input my data login') do
  find('login_email_input').set(DATA["login"])
  find('login_password_input').set(DATA["pass"])
  find('login_button').click
end
  
Then('I expect to see My Courses list') do
  assert_selector('my_courses_list', wait: 3)
end

Given('I input an invalid user data') do
  find('login_email_input').set("invalid_user@invalidemail.com")
  find('login_password_input').set("invalidpassword")
  find('login_button').click
end
  