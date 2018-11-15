class ApplicationController < ActionController::Base
    before_action :initialize_session
    before_action :track_and_load_visit_count
    before_action :load_shopping_cart

    private
    def initialize_session
        # OR operator checks if left side has value or not. If not, defaults it to 0.
        session[:visit_count] ||= 0

        # session for shopping cart
        session[:cart] ||= []
    end

    private
    def track_and_load_visit_count
        # increment
        @visit_count = session[:visit_count] + 1
        # store it
        session[:visit_count] = @visit_count
    end

    def load_cart
        @shopping_cart = Product.find(session[:cart])
    end

    def add_to_cart
        # .push method to add to the session[] (or append with '>>')
        # For the cart number in the header, use session[].size

    end
end
