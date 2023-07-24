class Order < ApplicationRecord
  enum payment_method: {
    credit: 0, #クレジットカード
    bank: 1, #銀行振込
  }

  has_many :order_items, dependent: :destroy
  belongs_to :customer #親モデル

end
