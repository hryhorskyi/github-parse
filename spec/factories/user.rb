# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    login { Faker::Name.first_name }
    full_name { Faker::Name.name }
    repos { Faker.datatype.array(5) }
  end
end
