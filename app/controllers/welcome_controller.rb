class WelcomeController < ApplicationController
  def index
    #  EX: LIKE AMAZONS FRONT PAGE FOR ITEMS ON SALE.
    # grab a unique random list of 4 products
    random = Product.order("RANDOM()").limit(4).uniq
    @random_product = random.first
    @random_product_2 =  random.last
    @random_product_3 =  random.second
    @random_product_4 =  random.third
  end
end
