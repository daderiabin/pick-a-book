# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    line_items = []
    @qnty = params[:qnty]
    @cart_items = params[:cart]
    @taxes = params[:taxes]
    @user_id = params[:user_id]

    if @cart_items.nil?
      redirect_to root_path
      return
    end

    @cart_items.each do |id|
      book = Book.find(id.to_i)
      quantity = @qnty[id.to_s]
      line_item = {
        name: book.title,
        amount: book.price.to_i * 100,
        currency: 'cad',
        quantity: quantity.to_i
      }
      line_items << line_item if book
    end

    @taxes.each do |k, v|
      line_item = {
        name: k.to_s,
        amount: v.to_i,
        currency: 'cad',
        quantity: 1
      }
      line_items << line_item if v.to_i.zero? == false
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: line_items,
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    place_order
    respond_to do |format|
      format.js
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel; end

  private

  def place_order
    subtotal = 0
    usr = User.find(@user_id)
    order = Order.new
    order.status = 0
    order.user_id = usr.id
    order.save

    @cart_items.each do |id|
      book = Book.find(id.to_i)
      quantity = @qnty[id.to_s]
      i_p = book.price.to_f * quantity.to_f
      subtotal += i_p
      l_i = LineItem.create(book_id: book.id,
                            order_id: order.id,
                            title: book.title,
                            quantity: quantity.to_i,
                            price: book.price.to_f)
      order.line_item_ids << l_i.id
    end
    order.sub_total = subtotal
    order.hst = usr.province.hst
    order.gst = usr.province.gst
    order.pst = usr.province.pst
    order.save
  end
end
