class Purchaser < ApplicationRecord
  belongs_to :user
  belongs_to :product
  hass_one :address
end
