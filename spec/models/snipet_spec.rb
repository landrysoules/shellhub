require 'rails_helper'

RSpec.describe Snipet, type: :model do
  it { is_expected.to validate_presence_of(:title)}
  it { is_expected.to validate_length_of(:title).is_at_least(2)}
  it { is_expected.to validate_presence_of(:content)}
  it { is_expected.to validate_length_of(:content).is_at_least(2)}
end
