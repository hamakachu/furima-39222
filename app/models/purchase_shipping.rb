class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, 
                :city, :address, :building, :phone, :token

    with_options presence: true do
    validates :user_id, :item_id, :city, :address, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone, format: {with: /\A\d{10,11}\z/}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    end


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, 
                    city: city, address: address, building: building, 
                    phone: phone, purchase_id: purchase.id)
  end
end