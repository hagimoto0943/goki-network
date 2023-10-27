FactoryBot.define do
  factory :fight do
    status { 1 }
    association :user
  end
end
