FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "タイトル#{n}" }
    sequence(:body) { |n| "本文#{n}" }
    post_types { rand(1) }
    association :user
  end
end
