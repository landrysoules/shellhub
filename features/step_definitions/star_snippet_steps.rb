Given(/^I am on a snippet page$/) do
  visit snipet_path(@snippet.id)
end

Given(/^there is at least one snippet in the system$/) do
  @snippet = FactoryGirl.create(:snipet)
end

When(/^I click the star icon$/) do
  click_link "star_icon"
  #star
end

Then(/^the stars counter for this snippet should increment$/) do
  expect(find("#star_counter").text).to eq("1")
end

Then(/^the star icon should become yellow$/) do
  expect(page).to have_css(".glyphicon.pull-right.glyphicon-star")
end

Given(/^I already gave this snippet a star$/) do
  click_link "star_icon"
end

Then(/^the stars counter for this snippet should decrease$/) do
  #puts save_page
  expect(find("#star_counter").text).to eq("")
end

Then(/^the star icon should become grey$/) do
  expect(page).to have_css(".glyphicon.pull-right.glyphicon-star-empty")
end

Given(/^I am anywhere in the site$/) do
  # Nothing here: the given is just used to document the scenario
end

When(/^I click on my starred snippets link$/) do
  visit my_starred_snipets_path
end

Then(/^I should see all the snippets I have given a star$/) do
  expect(page).to have_content("Starred snippets")
end

