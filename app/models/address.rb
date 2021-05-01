class Address
    include ActiveModel::Model
    attr_accessor :postal_code_id, :area_id, :city, :address_line, :building, :phonenumber, :purchaser
  
    with_options presence: true do
      validates :user_id, :postal_code_id, :city, :address_line, :building, :phonenumber, :purchaser
      validates :postal_code_id, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    end
    validates :area_id, numericality: {other_than: 0, message: "can't be blank"}
  
    def save
      purchaser = Purchaser.create(purchaser: purchaser, user_id: user_id)
      Address.create(postal_code_id: postal_code_id, area: area, city: city, address_line: address_line, building: building, phonenumber: phonenumber, :purchaser_id: purchaser_id)
    end
end

