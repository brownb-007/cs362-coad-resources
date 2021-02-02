FactoryBot.define do
  factory :resource_category do 
    sequence(:name) { |n| "resource_category #{n}"}
    :organization

    trait :active do
      actvie { true }
    end

    trait :inactive do 
      active { false }
    end
  end
end
