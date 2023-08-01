class Order < ApplicationRecord
  enum payment_method: {
    credit: 0, #クレジットカード
    bank: 1, #銀行振込
  }

  has_many :order_items, dependent: :destroy #中間テーブル
  has_many :items, through: :order_items
  belongs_to :customer #親モデル

  def item_total
    # order_itemのsubtotalの合計
    total = 0
    order_items.each do |order_item|
      total += order_item.subtotal
    end
    return total
  end

  def amount_total
    total = 0
    order_items.each do |order_item|
      total += order_item.amount
    end
    return total
  end

end
