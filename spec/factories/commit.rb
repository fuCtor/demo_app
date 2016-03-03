FactoryGirl.define do
  factory :commit do
    sha { SecureRandom.hex }
    user { User.all.sample || FactoryGirl.create(:user) }
    message { SecureRandom.hex }
    commited_at { Time.now }
  end
end