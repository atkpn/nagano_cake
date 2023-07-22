class CartItem < ApplicationRecord
  belongs_to :customer #親モデル
  belongs_to :item #親モデル
  
  def subtotal # 小計
    item.add_tax_price * amount
  end
end
