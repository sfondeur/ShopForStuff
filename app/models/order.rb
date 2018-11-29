# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :subtotal, presence: true
  validates :user, presence: true
end
