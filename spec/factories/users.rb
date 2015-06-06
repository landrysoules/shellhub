FactoryGirl.define do
  sequence(:email) {|n| "roger#{n}@spaceinvade.rs"}
  sequence(:username){|n| "user#{n}"}
  factory :user do
    password 'e411dfde423'
    email
    username
  end
end
