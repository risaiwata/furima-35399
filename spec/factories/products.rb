FactoryBot.define do
  factory :product do
    title                {"テストタイトル"}
    text                 {"テストテキスト"}
    category_id          {1}
    delivery_charge_id   {2}
    product_status_id    {1}
    area_id              {10}
    delivery_day_id      {3}
    price                {3000}
    association          :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
