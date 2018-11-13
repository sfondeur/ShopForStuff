class ApplicationController < ActionController::Base
    before_action :initialize_session
    before_action :track_and_load_visit_count
    before_action :load_shopping_cart

    private
    def initialize_session
        # OR operator checks if left side has value or not. If not, sets it to 0.
        # default
        session[:visit_count] ||= 0
        session[:shopping_cart] ||= 0
    end

    private
    def track_and_load_visit_count
        # increment
        @visit_count = session[:visit_count] + 1
        # store it
        session[:visit_count] = @visit_count
    end

    def load_shopping_cart
        @shopping_cart = session[:shopping_cart]
    end
end
