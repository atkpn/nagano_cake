class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:page])
    # @order_items = @orders.order_items
    # @customer = @orders.customer
  end

  # private

  # def order_params
  #   params.require(:order).permit(:postal_code, :address, :address_name, :payment_method, :postage, :total_payment)
  # end

end
