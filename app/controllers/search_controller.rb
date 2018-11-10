class SearchController < ApplicationController
    def index
    end

    def results
        @products = Product.where('title LIKE ?', "%#{params[:q]}%")
    end
end
