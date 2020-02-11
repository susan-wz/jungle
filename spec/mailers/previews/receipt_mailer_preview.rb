# Preview all emails at http://localhost:3000/rails/mailers/receipt_mailer
class ReceiptMailerPreview < ActionMailer::Preview

  def receipt_email
    @order = Order.first
    @line_items = LineItem.where("order_id = ?", @order)
    ReceiptMailer.receipt_email(@order, @line_items)
  end
end
