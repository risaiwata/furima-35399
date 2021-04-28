class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :delivery_day
  belongs_to :product_status
  belongs_to :delivery_charge
  belongs_to :category
  
  belongs_to :user 
  has_one_attached :image

  validates :title, :text, :price, presence: true
  validates :area_id, numericality: { other_than: 0 } 
  validates :delivery_day_id, numericality: { other_than: 0 } 
  validates :product_status_id, numericality: { other_than: 0 } 
  validates :delivery_charge_id, numericality: { other_than: 0 } 
  validates :category_id, numericality: { other_than: 0 } 
end
