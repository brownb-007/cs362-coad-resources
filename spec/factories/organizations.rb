FactoryBot.define do
  factory :organization do |n|
    sequence(:name) { |n| "#{n} organization"}
    sequence(:email) { |n| "#{n}@example.com"}
    phone { '444-444-444'}
    status { 0 }
    description { "very in depth stuff about a organization" }
    rejection_reason { "Fake" }
    primary_name { "Fake primary name "}
    secondary_name { "Fake secondary name"}
    secondary_phone { '555-555-555' }
    liability_insurance { false }
    title { "Fake Title"}
    transportation { :yes }
  end
end
