class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :order_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{10,11}\z/,}
    validates :order_id
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: delivery_source.id, city: city, block: block, phone_number: phone_number, order_id: order.id)
  end
end