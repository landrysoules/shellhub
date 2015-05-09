Given(/^there's a snipet titled "(.*?)" with "(.*?)" content$/) do |title, content|
  @snipet = FactoryGirl.create(:snipet, title: title, content: content)
end

When(/^I am on the homepage$/) do
  visit "/"
end

Then(/^I should see the "(.*?)" snipet$/) do |title|
  @snipet = Snipet.find_by_title(title)
  expect(page).to have_content(@snipet.title)
  expect(page).to have_content(@snipet.content)
end

