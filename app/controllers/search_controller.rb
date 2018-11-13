class SearchController < ApplicationController
    def index
    end

    def results
        @products = Product.where('title LIKE ? OR manufacturer LIKE ?', "%#{params[:q]}%", "%#{params[:q]}%")
        
    end
end
