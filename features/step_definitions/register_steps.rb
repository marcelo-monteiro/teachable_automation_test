include AutomationCore

Given('I fill the form with valid data') do
    fill_form(commom_user_data)
end

Given('I fill the form with registered e-mail data') do
    fill_form(registered_user_data)
end

Given('I fill the form with an invalid password') do
    fill_form(invalid_pass_user_data)
end