class Item < ApplicationRecord
  belongs_to :user

  validates :item_name, :content, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, :price, presence: true
end
