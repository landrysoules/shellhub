Given(/^I am on a snippet page$/) do
  visit snipet_path(@snippet.id)
end

When(/^I click the star icon$/) do
  click_link "star_icon"
end

Then(/^I should see a "(.*?)" message$/) do |message_type|
  case message_type
  when "increment"
    expect(page).to have_content("You have starred this snippet")
  when "decrease"
    expect(page).to have_content("You have un-starred this snippet")
  end
end

Then(/^the stars counter for this snippet should increment$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the star icon should become yellow$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I already gave this snippet a star$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^click the star icon$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the stars counter for this snippet should decrease$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the star icon should become grey$/) do
  pending # express the regexp above with the code you wish you had
end

