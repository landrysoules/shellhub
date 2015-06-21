require 'rails_helper'

describe User, type: :model do

  let(:user){create(:user)}

  context "database reflects the model" do
    it{should have_db_column(:email)}
    it{should have_db_column(:username)}
    it{should have_db_column(:encrypted_password)}
  end

  context "user is valid" do
    it "attributes are valid" do
      expect(user).to be_valid
    end
    it { should have_many(:snipets) }
  end

  context "user is not valid" do
    it "email is not valid" do
      user.email = "dumbemailaddress"
      expect(user).not_to be_valid
    end
    it "email is missing" do
      user.email = nil
      expect(user).not_to be_valid
    end
    it "username is missing" do
      user.username = nil
      expect(user).not_to be_valid
    end
  end

  context "rating system" do
    it{should have_many(:snipets)}
  end
end
