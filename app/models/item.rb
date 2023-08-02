class Item < ApplicationRecord
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy #中間テーブル
  has_many :orders, through: :order_items

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_yoko.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def add_tax_price # 税込価格
    (price * 1.1).floor
  end
  
  # def count #全件
  #   Item.count
  # end
end