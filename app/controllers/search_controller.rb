# frozen_string_literal: true

class SearchController < ApplicationController
  def index; end

  def results
    if params[:search][:category].present?
      @category = Category.find(params[:search][:category])
      @products = @category.products.where('title LIKE ?', "%#{params[:q]}%")
    else
      @products = Product.where('title LIKE ? OR manufacturer LIKE ?',
                                "%#{params[:q]}%", "%#{params[:q]}%")
    end
  end
end
