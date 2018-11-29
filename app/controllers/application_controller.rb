# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :initialize_session
  # before_action :track_and_load_visit_count
  before_action :load_cart

  private

  def initialize_session
    # OR operator checks if left side has value or not. If not, defaults it to 0.
    session[:visit_count] ||= 0

    # session array for shopping cart
    session[:cart] ||= []
    # prod = Product.find(35)
    # session[:thing] ||= {}
    # session[:thing][:prod] = prod
    # session[:thing][:prodname] = session[:thing][:prod]["title"].to_s
    # session[:thing][:quantity] = 2.to_i
    # session[:thing] = {}
  end

  # def track_and_load_visit_count
  #   # increment
  #   @visit_count = session[:visit_count] + 1
  #   # store it
  #   session[:visit_count] = @visit_count
  # end

  def load_cart
    @shopping_cart = Product.find(session[:cart])
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, :alert => 'Need to be logged in to create an order!'
    end
  end
end
