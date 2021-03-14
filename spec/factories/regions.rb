FactoryBot.define do
  factory :region do
    sequence(:name) { |n| "region #{n}"}

    trait :unspecified do
      name { 'Unspecified' }
    end
  end
end
