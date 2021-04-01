# spec/factories/items.rb
FactoryBot.define do
    factory :item do
      name { Faker::Music::Prince.album }
    end
  end