FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.free_email }

    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password { password }
    password_confirmation { password }

    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
    last_name { 'テスト' }
    first_name { 'タロウ' }
    kana_last_name { 'テスト' }
    kana_first_name { 'タロウ' }
  end
end
