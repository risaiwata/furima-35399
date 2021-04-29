class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :delivery_day
  belongs_to :product_status
  belongs_to :delivery_charge
  belongs_to :category
  
  belongs_to :user 
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :price, inclusion: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }
  end
    with_options numericality: { other_than: 0 } do
      validates :area_id
      validates :delivery_day_id
      validates :product_status_id
      validates :delivery_charge_id
      validates :category_id
  end
end
