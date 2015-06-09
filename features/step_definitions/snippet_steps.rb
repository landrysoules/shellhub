Given(/^I am authenticated$/) do
  @current_user = FactoryGirl.create(:user)
  @current_user_snippet = FactoryGirl.create(:snipet, user: @current_user, username: @current_user.username)
  authenticate @current_user
  expect(page).to have_content("Signed in successfully.")
end

When(/^I go to the new snippet page$/) do
  visit new_snipet_path
end

When(/^I fill in the snippet creation form$/) do
  fill_in "snipet_title", :with => "my first snippet"
  fill_in "snipet_content", :with => "ls"
  click_button "submit_snipet"
end

When(/^I go to my snippets page$/) do
  visit my_snipets_path(@current_user.id)
end

When(/^I click edit on a snippet$/) do
  click_link "edit"
end

When(/^I fill in the snippet edit form$/) do
  fill_in "snipet_title", :with => "edited title"
  fill_in "snipet_content", :with => "edited content"
  click_button "Update Snipet"
end

When(/^I click delete on a snippet$/) do
  click_link "delete"
end

When(/^I click ok on the confirm box$/) do
  page.driver.browser.switch_to.alert.accept
end

Given(/^I am on the home page$/) do
  create_snippet
  visit snipets_path
end

When(/^I click show on a snippet$/) do
  visit snipets_path
  first(".btn").click
end

Then(/^I should see this snippet details$/) do
  expect(current_path).to match(/snipets\/\d+/)
end

Then(/^I should see only my snippets$/) do
  expect(page).to have_css('.panel-title', count:1)
end

Then(/^I should see that my snippet is successfully created$/) do
  expect(page).to have_content("Snipet was successfully created.")
  expect(current_path).to match(/users\/\d+\/snipets/)
end

Then(/^I should see that my snippet is successfully updated$/) do
  expect(page).to have_content("Snipet was successfully updated.")
  expect(current_path).to match(/snipets\/\d+/)
end

Then(/^I should see that my snippet is successfully deleted$/) do
  expect(page).to have_content("Snipet was successfully destroyed.")
  expect(current_path).to match(/snipets/)
end

Given(/^I am an anonymous user$/) do
  # Nothing to do here
end

When(/^I go to the snippets page$/) do
  visit snipets_path
end

Then(/^I should see all snippets$/) do
  expect(page).to have_css('.panel-title', count: 10)
end

Given(/^several registered users have already created snipets$/) do
  create_snippets
end

When(/^I click execute$/) do
  click_button 'launchSnipet'
end

Then(/^I should see the command output$/) do
  response = call_web_service # HTTParty.post('https://shellhub-api.herokuapp.com/run', body:{command:'pwd'}.to_json, :debug_output => $stdout).body
  expect(response.to_s).to match("{\"command\":\"pwd\",\"result\":[\"/app\"]}")
end

