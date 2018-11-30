class ChargesController < ApplicationController
  def new
    # amount is in cents
    # comes from cart session
    # @amount should be the TOTAL at this point
    
    @amount = (session[:total].to_d * 100)
    @user = current_user.name
    @description = "Hi #{@user}, enter your payment info."
    
  end

  def create
    # load up amount again to verify it wasn't changed/tampered with
    # amount needs to be in cents
    @amount = (session[:total].to_d * 100).to_i
    # @sub = session[:subtotal]

    @customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      :customer    => @customer.id,
      :amount      => @amount,
      :description => @description,
      :currency    => 'cad'
    )
    
    # If returned @charge object matches the amount and is paid for, create Order in DB
    if @charge.paid && @charge.amount == @amount

      @order = Order.create(:first_name => current_user.name,
                            :last_name => current_user.lastname,
                            :subtotal => session[:subtotal], 
                            :user => current_user,
                            :status => 'Paid',
                            :pst => session[:pst],
                            :gst => session[:gst],
                            :hst => session[:hst] )

      session[:cart].each do |item|
        product = Product.find(item)
        OrderItem.create(:order => @order, :product => product, :price => product.price, :quantity => 1)
      end

      # 3) destroy cart sessions
    end

    # exception for error, displays flash
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
