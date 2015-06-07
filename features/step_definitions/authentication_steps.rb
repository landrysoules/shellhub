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

When(/^I go to signup page$/) do
  visit "/users/sign_up"
end

When(/^I fill in registration form$/) do
  @current_user = FactoryGirl.build(:new_user)
  fill_in "user_username", with: @current_user.username
  fill_in "user_email", with: @current_user.email
  fill_in "user_password", with: @current_user.password
  fill_in "user_password_confirmation", with: @current_user.password
  click_button 'Sign up'
end

Then(/^I should see a success signup message$/) do
  expect(page).to have_content 'Welcome! You have signed up successfully.'
end

Given(/^I am a registered user$/) do
  @registered_user = FactoryGirl.create(:new_user)
end

When(/^I go to the signin page$/) do
  visit new_user_session_path
end

When(/^I fill in the signin form$/) do
  fill_in 'user_email', with: @registered_user.email
  fill_in 'user_password', with: @registered_user.password
  click_button 'Log in'
end

Then(/^I should see a success signin message$/) do
  expect(page).to have_content 'Signed in successfully.'
end

Given(/^I am signed in$/) do
  @already_signed_in = FactoryGirl.create(:new_user)
end

When(/^I click the signout link$/) do
  visit destroy_user_session_path
end

Then(/^I should see a success signout message$/) do
  expect(page).to have_content 'Signed out successfully.'
end

When(/^I fill in registration form with incorrect data$/) do
  @current_user = FactoryGirl.build(:new_user)
  fill_in "user_username", with: @current_user.username
  fill_in "user_email", with: 'dummy_email'
  fill_in "user_password", with: @current_user.password
  fill_in "user_password_confirmation", with: @current_user.password
  click_button 'Sign up'
end

Then(/^I should see a registration error$/) do
  expect(page).to have_content 'prohibited this user from being saved'
end

When(/^I fill in the signin form with incorrect data$/) do
  fill_in 'user_email', with: @registered_user.email
  fill_in 'user_password', with: 'incorrectpassword'
  click_button 'Log in'
end

Then(/^I should see a signin error$/) do
  expect(page).to have_content 'Invalid email or password.'
end

