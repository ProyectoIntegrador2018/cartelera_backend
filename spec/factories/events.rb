FactoryBot.define do
  factory :event do
    applicant_id 1
    sponsor_id 1
    status 0
    name 'MyString'
    description 'MyString'
    location 'MyString'
    campus 'MTY'
    category
    photo 'MyString'
    cost '9.99'
    public_event 0
    start_datetime '2018-03-03 14:46:04'
    end_datetime '2018-03-03 14:46:04'
    requirements_to_register 'MyString'
    registration_url 'MyString'
    registration_deadline '2018-03-03 14:46:04'
    schedule 'MyString'
    facebook_url 'MyString'
    twitter_url 'MyString'
    contact_phone 'MyString'
    contact_name 'MyString'
    contact_email 'MyString'
    created_at '2018-03-03 14:46:04'
  end
end
