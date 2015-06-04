Given(/^I am authenticated$/) do
  user = User.new email: "landry.soules@gmail.com", password: "1Password", username: "landry"
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

Then(/^I should see a success message$/) do
  expect(page).to have_content("Snipet was successfully created.")
end

Then(/^I should see my snippets page$/) do
  expect(current_path).to match(/users\/\d+\/snipets/)
end
