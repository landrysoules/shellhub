# In order to avoid repeating operations supposed to take place x times in various tests, I created this module
# This article helped a lot: http://blog.pivotal.io/labs/labs/cucumber-step-definitions-are-not-methods

module Helpers
  def signup(user)
    visit destroy_user_session_path
    visit new_user_registration_path
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    fill_in "user_username", :with => user.username
    click_button "Sign up"
  end

  def authenticate(user)
    visit destroy_user_session_path
    visit new_user_session_path
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    click_button "submit_signin"
  end
end

World Helpers # Makes this module visible from all the cucumber tests
