FactoryBot.define do
  factory :item do
    association :user
    name                           {Faker::Name.initials(number: 2)}
    explanation                    {'test'}
    image                          {'design.jpg'}
    price                          {'1000'}
    condition_id                   {'2'}
    shipping_charge_id             {'2'}
    prefectures_id                 {'2'}
    estimated_shipping_date_id     {'2'}
    category_id                    {'2'}

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end

  end
end
