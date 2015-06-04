# Code to execute before some test methods, in order to keep it DRY !
# Based on Aleksandar's remarks, and this link: https://www.relishapp.com/rspec/rspec-core/v/2-11/docs/example-groups/shared-context
include Devise::TestHelpers
require 'rails_helper'

shared_context "signin" do
  sign_in create(:user)
end
