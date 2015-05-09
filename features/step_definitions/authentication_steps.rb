Given(/^I am not authenticated$/) do
  #! user_signed_in?
  visit '/users/sign_out'
end

When(/^I go to signup$/) do
  visit "/users/sign_up"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field_name, field_value|
  fill_in field_name, :with => field_value
end

When(/^I click "(.*?)" button$/) do |button_label|
  click_button button_label
end

Then(/^I should see "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

