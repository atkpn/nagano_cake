class Order < ApplicationRecord
  enum payment_method: {
    credit: 0, #クレジットカード
    bank: 1, #銀行振込
  }

  has_many :order_items, dependent: :destroy #中間テーブル
  has_many :items, through: :ordered_items
  belongs_to :customer #親モデル

end
