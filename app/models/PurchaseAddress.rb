class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :purchase_id, :post_code, :area_id, :city, :address, :building_name, :phone_number, :token

  validates :area_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/ }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    addresses = Address.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end