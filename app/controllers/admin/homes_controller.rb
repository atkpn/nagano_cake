class Admin::HomesController < ApplicationController
  def top
    @orders = OrderItem.page(params[:page])
  end
end
