require 'rails_helper'

RSpec.describe Event, type: :model do
  before { @event = FactoryBot.build(:event) }

  subject { @event }

  it { should validate_presence_of(:applicant_id) }
  it { should validate_presence_of(:sponsor_id) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:campus) }
  it { should validate_presence_of(:category_id) }
  it { should validate_presence_of(:public_event) }
  it { should allow_value('example@domain.com').for(:contact_email) }
  it { should respond_to(:description) }
  it { should respond_to(:location) }
  it { should respond_to(:photo) }
  it { should respond_to(:cost) }
  it { should respond_to(:start_datetime) }
  it { should respond_to(:end_datetime) }
  it { should respond_to(:requirements_to_register) }
  it { should respond_to(:registration_url) }
  it { should respond_to(:registration_deadline) }
  it { should respond_to(:schedule) }
  it { should respond_to(:facebook_url) }
  it { should respond_to(:twitter_url) }
  it { should respond_to(:contact_phone) }
  it { should respond_to(:contact_name) }
  it { should respond_to(:contact_email) }
end
