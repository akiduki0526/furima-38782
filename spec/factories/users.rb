FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    
    password              {"a1" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'佐藤'}
    last_name             {'太郎'}
    first_name_kana       {'サトウ'}
    last_name_kana        {'タロウ'}
    birth_day            { Faker::Date.backward }


  end
end
