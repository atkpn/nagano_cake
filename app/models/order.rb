class Order < ApplicationRecord
  enum payment_method: {
    credit: 0, #クレジットカード
    bank: 1, #銀行振込
  }
end
