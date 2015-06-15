require 'rails_helper'

describe Star do

  context "database reflects the model" do
    it{should have_db_column(:user_id)}
    it{should have_db_column(:snipet_id)}
    it{should have_db_index(:user_id)}
    it{should have_db_index(:snipet_id)}
  end

  context "validation" do
    it "associated user must exist" do
      pending
    end
    it "associated snippet must exist" do
      pending
    end

    it {should belong_to(:user)}
    it {should belong_to(:snipet)}

  end
end
