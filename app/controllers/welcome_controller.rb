class WelcomeController < ApplicationController
  def index
    # QUERY FOR A LIMITED AMOUNT OF PRODUCTS THAT HAVE BEEN NEWLY ADDED OR UPDATED.
    #  EX: LIKE AMAZONS FRONT PAGE FOR ITEMS ON SALE.
    @random_product = Product.order("RANDOM()").first
  end
end