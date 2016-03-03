FactoryGirl.define do
  factory :user do
    sequence(:name)  {|n| "user#{n}"}
    sequence(:email) {|n| "user#{n}@host.tld"}
  end
end