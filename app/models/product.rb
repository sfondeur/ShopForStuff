# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  mount_uploader :picture, PictureUploader

  accepts_nested_attributes_for :product_categories, allow_destroy: true

  validates :title, :price, presence: true
end
