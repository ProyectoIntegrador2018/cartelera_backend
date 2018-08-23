require 'rails_helper'

RSpec.describe Category, type: :model do
  before { @category = FactoryBot.build(:category) }

  subject { @category }

  it { should validate_presence_of(:name) }
end
