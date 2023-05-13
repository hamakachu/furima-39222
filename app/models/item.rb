class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :charge_bearer
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :image, :item_name, :introduce, presence: true
  validates :category_id, :condition_id, :charge_bearer_id, :prefecture_id, :shipping_date_id, numericality: 
            { other_than: 1, message: "can't be blank" }
  validates :price, numericality: {greater_than: 299, less_than: 10000000}

end
