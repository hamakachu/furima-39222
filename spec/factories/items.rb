FactoryBot.define do
  factory :item do
    item_name        {Faker::Lorem.word}
    introduce        {Faker::Lorem.sentence}
    category_id      {Faker::NUmber.between(from: 2, to: 11)}
    condition_id     {Faker::NUmber.between(from: 2, to: 7)}
    charge_bearer_id {Faker::NUmber.between(from: 2, to: 3)}
    prefecture_id    {Faker::NUmber.between(from: 2, to: 48)}
    shipping_date_id {Faker::NUmber.between(from: 2, to: 4)}
    price            {Faker::NUmber.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
