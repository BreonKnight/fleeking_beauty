  FactoryGirl.define do
    factory :user do
      password "testtest"
      first_name 'Jon'
      last_name 'Snow'
      email 'email@email.email'
      userName 'userName'
    end
  end