class ReceiptMailer < ApplicationMailer

  def receipt_email(order, line_items)
    @order = order
    @line_items = line_items
    mail(to: @order.email, subject: "Order Confirmation #{ @order.id }")
  end

end
