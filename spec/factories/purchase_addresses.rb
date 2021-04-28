FactoryBot.define do
  factory :purchase_address do
    post_code     { '252-3872' }
    area_id       { 2 }
    city          {'横浜市緑区'}
    address       {'青山1-1-1'}
    building_name {'ビル'}
    phone_number  {12345678900}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
