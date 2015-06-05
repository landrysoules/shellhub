Given(/^I am authenticated$/) do
  @current_user = FactoryGirl.create(:user)
  signup @current_user
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

Then(/^I should see a "(.*?)" message$/) do |message_type|
  case message_type
  when "success"
    expect(page).to have_content("Snipet was successfully created.")
  when "update success"
    expect(page).to have_content("Snipet was successfully updated.")
  when "update delete"
    expect(page).to have_content("Snipet was successfully destroyed.")
  end
end

Then(/^I should see my snippets page$/) do
  expect(current_path).to match(/users\/\d+\/snipets/)
end

When(/^I go to my snippets page$/) do
  #visit new_snipet_path
  #fill_in "snipet_title", :with => "my first snippet"
  #fill_in "snipet_content", :with => "ls"
  #click_button "submit_snipet"
  FactoryGirl.create(:snipet, user_id: @current_user.id, username: @current_user.username)
  #FIXME: use association, see https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
  FactoryGirl.create(:snipet,  username: "jesse")
  FactoryGirl.create(:snipet,  username: "walt")
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

Then(/^I should see my snippet page$/) do
  expect(page).to have_content("Execution output")
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
  click_link "show"
end

Then(/^I should see this snippet details$/) do
  expect(current_path).to match(/snipets\/\d+/)
end

Then(/^I should see snippets page$/) do
  expect(current_path).to match(/snipets/)
end

Then(/^I should see only my snippets$/) do
  pending #save_and_open_page
end
