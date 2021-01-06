class Order
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :address, :building, :tel_number, :user_id, :item_id, :purchase_record_id,
                :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :tel_number, format: { with: /\A\d{11}\z/, message: 'Input only number' }
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building: building,
                           tel_number: tel_number, purchase_record_id: purchase_record.id)
  end
end
