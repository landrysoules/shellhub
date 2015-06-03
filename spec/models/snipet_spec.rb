require 'rails_helper'

describe Snipet do
  it 'has a valid factory' do
    expect(create(:snipet)).to be_valid
  end

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
