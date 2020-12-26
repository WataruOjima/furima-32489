class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # validates :name, :description, :price, :image, presence: true
  validates :item_name,          presence: true
  validates :user_id,            presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true
  validates :condition_id,       presence: true
  validates :price,              presence: true, 
  numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 10000000, message: "is invalid"}
  validates :prefecture_id,      presence: true
  validates :shipping_date_id,   presence: true
  validates :shipping_charge_id, presence: true
  validates :image,              presence: true

  validates :shipping_charge_id, :category_id, :condition_id, :prefecture_id, :shipping_date_id,
  numericality: { other_than: 0 } 


has_one :Purchase_record
has_one_attached :image
belongs_to :user
belongs_to :category
belongs_to :condition
belongs_to :prefecture
belongs_to :shipping_date
belongs_to :shipping_charge
end
