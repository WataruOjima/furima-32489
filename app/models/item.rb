class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # validates :name, :description, :price, :image, presence: true

  with_options presence: true do
    validates :item_name
    validates :description
    validates :image
  end

  with_options presence: true, numericality: { other_than: 0, message: "is invalid"} do
    validates :category_id
    validates :condition_id
    validates :prefecture_id
    validates :shipping_date_id
    validates :shipping_charge_id
  end
  
  validates :price,              presence: true, 
  numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 10000000, message: "is invalid"}


has_one :purchase_record
has_one_attached :image
belongs_to :user
belongs_to :category
belongs_to :condition
belongs_to :prefecture
belongs_to :shipping_date
belongs_to :shipping_charge
end
