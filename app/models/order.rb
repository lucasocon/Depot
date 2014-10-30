class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = [ "Check", "Credit Card", "Purchase order" ]

  after_create :increment_product_sells

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  private

  def increment_product_sells

    line_items.each do |line_item|
      product = line_item.product
      q = line_item.quantity

      product.update_attribute(:sells, product.sells + q)
    end
  end
end
