class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
  end

  def index
  end

  def show
  end

  def confirm
  end

  def thanks
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_id, :postal_code, :address, :address_name, :payment_method, :postage, :total_payment)
  end

end
