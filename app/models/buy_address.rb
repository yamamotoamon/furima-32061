class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :shipping_area_id, :municipality, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipping_area_id, numericality: { other_than: 1, message:"must be other than 1" }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, }
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, }
    validates :user_id
    validates :item_id
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building: building, phone_number: phone_number, buy_id: buy.id)
  end
end