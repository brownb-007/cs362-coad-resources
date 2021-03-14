FactoryBot.define do
  factory :organization do |n|
    sequence(:name) { |n| "#organization#{n}"}
    sequence(:email) { |n| "person#{n}@example.com"}
    phone { '444-444-444'}
    description { "very in depth stuff about a organization" }
    rejection_reason { "Fake" }
    primary_name { "Fake primary name "}
    secondary_name { "Fake secondary name"}
    secondary_phone { '555-555-555' }
    liability_insurance { false }
    title { "Fake Title"}
    transportation { :yes }

    trait :approved do
      status { 0 }
    end

    trait :rejected do
      status { 1 }
    end

    trait :submitted do
      status { 2 }
    end
  end
end
