class PagesController < ApplicationController

    def permalink
        @page = Page.find_by(permalink: params[:permalink])
        
        if @page.nil?
            redirect_to root_path
        else
            render :show
        end
    end

    def home
    end
    
    def show
        @page = Page.find(params[:id])
    end
    
    def about
    end
end
