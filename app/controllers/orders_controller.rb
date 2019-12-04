# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = Order.where(['user_id = ?', current_user.id]).order('created_at DESC')
  end

  def show
    @order = Order.find(params[:id])
    if @order.status == 0
      @status = 'Placed'
    elsif @order.status == 1
      @status = 'Paid'
    elsif @order.status == 2
      @status = 'Shipped'
    elsif @order.status == 3
      @status = 'Completed'
    end
  end
end
