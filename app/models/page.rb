# frozen_string_literal: true

class Page < ApplicationRecord
  # empty model for static pages
  validates :title, :content, presence: true
end
