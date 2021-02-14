FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com"}
    password { "Fake12345" }

    trait :admin do
      role { 'admin' }
    end

    trait :mem_of_org do 
      role { :organization }
    end

    after :create do |u|
      u.confirm
    end
  end
end
