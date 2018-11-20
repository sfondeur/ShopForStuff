# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories

  validates :title, presence: true
end
