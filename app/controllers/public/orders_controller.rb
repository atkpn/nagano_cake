class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    # 注文情報の保存
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    # 注文商品の保存
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.item_id = cart_item.item_id
      @order_item.purchase_price = (cart_item.item.price * 1.1).floor
      @order_item.amount = cart_item.amount
      @order_item.save
    end

    # カートの中身を削除
    @cart_items.destroy_all

    # リダイレクト
    redirect_to thanks_orders_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def confirm #注文情報確認
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.address_name = current_customer.last_name + current_customer.first_name

    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
    @total = 0
    # @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end

  def thanks
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :address_name, :payment_method, :postage, :total_payment)
  end

end
