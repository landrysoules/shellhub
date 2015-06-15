require 'rails_helper'

describe Snipet do

  context "database reflects the model" do
    it{should have_db_column(:title)}
    it{should have_db_column(:content)}
    it{should have_db_column(:execution_output)}
    it{should have_db_column(:user_id)}
    it{should have_db_column(:username)}
  end

  context "valid creation" do
    it "is created with all fields correctly filled in" do
      expect(build(:snipet)).to be_valid
    end
    it{should belong_to(:user)}
  end
  context "invalid creation" do
    it 'is invalid without a title' do
      expect(build(:snipet, title: nil)).not_to be_valid
    end

    it 'is invalid if title length < 2' do
      expect(build(:snipet, title: 'a')).not_to be_valid
    end

    it 'is invalid without a content' do
      expect(build(:snipet, content: nil)).not_to be_valid
    end

    it 'is invalid if content length < 2' do
      expect(build(:snipet, content: 'a')).not_to be_valid
    end

    it "should belong to a user" do
      expect(build(:snipet)).to belong_to(:user)
    end
  end

  context "rating system" do
    it{should have_many(:users)}
  end
end
