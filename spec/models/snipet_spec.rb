require 'rails_helper'

describe Snipet do

  describe "associations" do
    it{should belong_to(:user)}
  end

  describe "toggle_star" do
    let(:snippet){create(:snipet)}
    let(:star){build(:star)}
    let(:user){build(:user)}
    let(:stars){snippet.stars}
    before do
        expect(snippet).to receive(:stars).at_least(:once).and_return(stars)
    end
    context "this snippet is already starred" do
      it "remove the star" do
        expect(stars).to receive(:find_by_user_id).and_return(star)
        expect(star).to receive(:destroy)
        snippet.toggle_star(user)
      end
    end
    context "this snippet isn't starred yet" do
      it "add a star" do
        expect(stars).to receive(:find_by_user_id).and_return(nil)
        expect(stars).to receive(:create)
        snippet.toggle_star(user)
      end
    end
  end
  describe "rating system" do
    it{should have_many(:starring_users)}
  end
  describe "database reflects the model" do
    it{should have_db_column(:title)}
    it{should have_db_column(:content)}
    it{should have_db_column(:execution_output)}
    it{should have_db_column(:user_id)}
    it{should have_db_column(:username)}
  end
  describe "creation" do
    context "valid creation" do
      it "is created with all fields correctly filled in" do
        expect(build(:snipet)).to be_valid
      end
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
    end
  end
end
