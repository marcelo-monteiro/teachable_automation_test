Given('I am on {string}') do |homepage|
    homepage = DATA[homepage]
    visit(homepage)
  end
  
Given('I click on {string}') do |element|
  find(element).click
end

Then('I expect to see the message {string}') do |text|
  assert_text(text)
end