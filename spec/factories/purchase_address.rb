FactoryBot.define do
  factory :purchase_address do
    post_code {'111-1111'}
    phone_number {'09000000000'}
    district {'ああ'}
    address {'ああ'}
    building {'ああ'}
    prefectures_id {'2'}
    token {"tok_abcdefghijk00000000000000000"}

  end
end