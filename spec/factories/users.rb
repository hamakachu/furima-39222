FactoryBot.define do
 factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6) + "a" + "1"}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    family_name           {Gimei.family.kanji + "あ"}
    first_name            {Gimei.first.kanji + "あ"}
    family_kana           {Gimei.family.katakana}
    first_kana            {Gimei.first.katakana}
    birth                 {Faker::Date.between(from: '1930-1-1', to: '2018-12-31')}
  end
end