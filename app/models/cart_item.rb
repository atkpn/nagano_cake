class CartItem < ApplicationRecord
  belongs_to :customer #親モデル
  belongs_to :item #親モデル
end
