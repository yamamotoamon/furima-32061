class Item < ApplicationRecord

  belongs_to :user
  has_one :buy
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :shipping_area
  belongs_to :shipping_day

  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :price, format: { with: /\A[0-9]+\z/ }, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_id, numericality: { other_than: 1 }
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :shipping_day_id, numericality: { other_than: 1 }
  end
end
