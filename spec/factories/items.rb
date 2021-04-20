FactoryBot.define do
  factory :item do
    image       {Faker::Lorem.sentence}
    item_name   {"商品名"}
    description {"説明"}
    category_id {2}
    status_id   {2}
    judgment_id {2}
    area_id     {2}
    days_id     {2}
    cost        {1000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
