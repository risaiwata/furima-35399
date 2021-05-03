FactoryBot.define do
  factory :address do
    card_number    {4242424242424242}
    card_exp_moth  {12}
    card_exp_year  {23}
    card_cvc       {123}
    postal_code_id {'123-4567'}
    area_id        {5}
    city           {'狛江市'}
    address_line   {'中和泉4-1-3'}
    building       {'道新会館'}
    phonenumber    {'08012345678'}
    association    :purchaser
  end
end
