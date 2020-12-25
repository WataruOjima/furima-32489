class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
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

  validates :genre_id, :category_id, :ondition_id, :prefecture_id, :shipping_date_id,
  numericality: { other_than: 1 } 


has_one :Purchase_record
has_one_attached :image

belongs_to  :user, :category_id, :condition_id, :prefecture_id, :shipping_date_id, :shipping_charge_id

end
