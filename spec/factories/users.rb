FactoryGirl.define do
    factory :user do
        name  Faker::Name.name
        sequence(:email) { |n| "#{n}#{Faker::Internet.email}" }
    end
end