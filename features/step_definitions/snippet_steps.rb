Given(/^I am authenticated$/) do
  user = User.new email: "landry.soules@gmail.com", password: "1Password", username: "landry"
  signup user
  authenticate user
  page.assert_text "Signed in successfully."
end

When(/^I fill in the snippet creation form$/) do
  #TODO: check why cucumber doesn't recognize routing helpers
  #visit new_snipet
  visit "/snipets/new"
  fill_in "snipet_title", :with => "my first snippet"
  fill_in "snipet_content", :with => "ls"
  click_button "submit_snipet"
end

Then(/^I should see a success message$/) do
  page.assert_text "Snipet was successfully created."
end

Then(/^I should see my snippets page$/) do
  expect(current_path).to match(/users\/\d+\/snipets/)
end
