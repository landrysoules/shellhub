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

  def create_snippet
    FactoryGirl.create(:snipet)
  end

  def create_snippets
    snipets = FactoryGirl.create_list(:snipet,10)
    #snipets.each do |snipet|
    #puts snipet.inspect
    #puts snipet.user.inspect
    #end
  end
  
  def call_web_service
    VCR.use_cassette "sinatra_cassette" do
      HTTParty.post('https://shellhub-api.herokuapp.com/run', body:{command:'pwd'}.to_json, :debug_output => $stdout).body
    end
  end

end

World Helpers # Makes this module visible from all the cucumber tests
