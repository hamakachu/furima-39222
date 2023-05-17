class PurchaseShipping
  include ActiveModel::model
    attr_accessor :user_id, :item_id, :postal_cord, :prefecture_id,
                  :city, :adress, :building, :phone, :purchase_id

    with_options presence: true do
    validates :user_id, :item_id, :purchace_id
    
    end

  def save
  end
end