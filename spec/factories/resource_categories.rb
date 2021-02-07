FactoryBot.define do
  factory :resource_category do 
    sequence(:name) { |n| "resource_category #{n}"}

    trait :active do
      active { true }
    end

    trait :inactive do 
      active { false }
    end
  end
end
