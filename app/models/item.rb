class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
  end

  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: { less_than_or_equal_to: 9_999_999, greater_than_or_equal_to: 300 }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_source_id
    validates :until_delivery_id
  end

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :delivery_source
  belongs_to :until_delivery
end
