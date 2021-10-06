# frozen_string_literal: true

# Module to Generate User data for tests
module GenerateUserData
  include RSpec::Matchers
  include Capybara::DSL
  include Cucumber::Glue::ProtoWorld

  def commom_user_data
    {
      full_name_input: FFaker::Name.name, 
      email_input: "tst_teachable#{Faker::Number.number(digits: 9)}@putsbox.com",
      password_input: "Test123456@"
    }
  end

  def registered_user_data
    {
      full_name_input: "Teachable Tester", 
      email_input: "teachable_tester@putsbox.com",
      password_input: "Test123456@"
    }
  end

  def invalid_pass_user_data
    {
      full_name_input: FFaker::Name.name, 
      email_input: "tst_teachable#{Faker::Number.number(digits: 9)}@putsbox.com",
      password_input: "123@"
    }
  end


end
