# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  mount_uploader :picture, PictureUploader

  accepts_nested_attributes_for :product_categories, allow_destroy: true

  validates :title, :price, presence: true

  # scope :order_by, ->(type) do
  #   case type
  #   when 'title'
  #     order :title
  #   when 'price_asc'
  #     order 'price - price * discount ASC'
  #   when 'price_desc'
  #     order 'price - price * discount DESC'
  #   end
  # end
end
