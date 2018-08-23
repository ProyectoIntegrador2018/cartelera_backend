require 'rails_helper'

RSpec.describe Registree, type: :model do
  before { @registree = FactoryBot.build(:registree) }

  subject { @registree }

  it { should validate_presence_of(:user_email) }
  it { should validate_presence_of(:event_id) }
  it { should allow_value('example@domain.com').for(:user_email) }
end
