class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :description
    validates :image
  end
  VALID_PRICEL_HALF = /\A[0-9]+\z/
  validates :cost,  presence: true, format: { with: VALID_PRICEL_HALF },
                    numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :judgment_id
    validates :area_id
    validates :days_id
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :days
  belongs_to :judgment
  belongs_to :status
end
