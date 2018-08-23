require 'rails_helper'

RSpec.describe Tag, type: :model do
  before { @tag = FactoryBot.build(:tag) }

  subject { @tag }

  it { should validate_presence_of(:name) }
  # TODO: validate uniqueness of name when we make Tag-Event relationship N to M
end
