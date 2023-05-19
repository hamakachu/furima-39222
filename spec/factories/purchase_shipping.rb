FactoryBot.define do
  factory :purchase_shipping do
    association :user
    association :item
    postal_code   {"111" + "-" + Faker::number.number(digits: 4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {Gimei.city.kanji}
    address       {Gimei.town.kanji}
    building      {Faker::Lorem.word}
    phone         {"0" + Faker::Number.between(from: 100000000, to: 9999999999)}
    token         {"tok_" + Faker::Faker::Alphanumeric.alphanumeric(number: 28)}
  end
end
