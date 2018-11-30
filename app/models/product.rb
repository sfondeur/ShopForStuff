# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  mount_uploader :picture, PictureUploader

  accepts_nested_attributes_for :product_categories, allow_destroy: true

  validates :title, :price, presence: true

  scope :newly_added, -> { order(created_at: :desc) }
  scope :updated,     -> { order(updated_at: :desc) }

  def self.sort_by(sort_param)
    case sort_param
    when 'newly_added'
      newly_added
    when 'updated'
      updated
    else
      all
    end
  end
end
