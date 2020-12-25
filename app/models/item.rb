class Item < ApplicationRecord
  validates :item_name,          presence: true
  validates :user_id,            presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :price,              presence: true
  validates :prefecture_id,      presence: true
  validates :shipping_date_id,   presence: true
  validates :shipping_charge_id, presence: true
  validates :image,              presence: true


has one :Purchase_record
belongs_to :user
has_one_attached :image
end
