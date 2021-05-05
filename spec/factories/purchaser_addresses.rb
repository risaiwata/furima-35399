FactoryBot.define do
  factory :purchaser_address do
    postal_code_id {'123-4567'}
    area_id        {5}
    city           {'狛江市'}
    address_line   {'中和泉4-1-3'}
    building       {'道新会館'}
    phonenumber    {'08012345678'}
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
