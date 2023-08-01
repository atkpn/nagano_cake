class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @customer = @order.customer
  end

  # private

  # # def order_params
  # #   params.require(:order).permit(:postal_code, :address, :address_name, :payment_method, :postage, :total_payment)
  # # end

end
