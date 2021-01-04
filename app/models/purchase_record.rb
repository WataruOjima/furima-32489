class PurchaseRecord < ApplicationRecord
  has_one :shipping_address
  belongs_to :user, optional: true
  belongs_to :item
end
