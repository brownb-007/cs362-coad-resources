FactoryBot.define do
  factory :ticket do 
    name { "fake ticket"}
    description { 'fake ticket description' }
    phone { '+1443332111' }
    closed { false }
    closed_at { '' }
    region
    resource_category

    trait :open_ticket do
      closed{ false }
    end

    trait :closed_ticket do
      closed{ true }
    end

    trait :has_region do
      region
    end

    trait :has_organization do
      organization
    end

  end
end
