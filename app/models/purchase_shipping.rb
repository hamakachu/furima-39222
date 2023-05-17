class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, 
                :city, :address, :building, :phone, :purchase_id

    with_options presence: true do
    validates :user_id, :item_id, :address, :purchace_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :phone, format: {with: /\A\d{10,11}\z/}
    end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, 
                    city: city, address: address, building: building, 
                    phone: phone, purchase_id: purchase.id)
  end
end