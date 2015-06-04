Given(/^I am authenticated$/) do
  # FIXME: is it possible to use factorygirl here (build(:user)) in place of User.new ?
  user = User.new email: "landry.soules@gmail.com", password: "7ninahartley7", username: "landry"
  signup user
  authenticate user
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
  if message_type.equal? "success"
    expect(page).to have_content("Snipet was successfully created.")
  elsif message_type.equal? "update success"
    expect(page).to have_content("Snipet was successfully updated.")
  elsif message_type.equal? "update delete"
    expect(page).to have_content("Snipet was successfully destroyed.")
  end
end

Then(/^I should see my snippets page$/) do
  expect(current_path).to match(/users\/\d+\/snipets/)
end

When(/^I go to my snippets page$/) do
  visit new_snipet_path
  fill_in "snipet_title", :with => "my first snippet"
  fill_in "snipet_content", :with => "ls"
  click_button "submit_snipet"

  #FIXME: How can I get current_user id, in place of writing id ?
  visit my_snipets_path(3)
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
  visit snipets_path
end

When(/^I click show on a snippet$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see this snippet details$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see snippets page$/) do
  expect(current_path).to match(/snipets/)
end

Then(/^I should see only my snippets$/) do
  pending # express the regexp above with the code you wish you had
end
