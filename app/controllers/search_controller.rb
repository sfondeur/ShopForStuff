class SearchController < ApplicationController
    def index
    end

    def results
        if params[:search][:category].present?
            @category = Category.find(params[:search][:category])
            @category_name = @category.title
            @products = @category.products.where('title LIKE ?', "%#{params[:q]}%")
        else
            @products = Product.where('title LIKE ? OR manufacturer LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
        end
        
    end
end
