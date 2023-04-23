class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image

  validates :item_name, :content, :image, presence: true

  with_options presence: true, inclusion: { in: 300..9999999 }, numericality: { only_integer: true } do
    validates :price
  end

  validates :category_id, :status_id, :delivery_charge_id, :prefecture_id, :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank" } 

end
