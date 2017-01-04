class CartsController < ApplicationController

  def index
    outings = Cart.new(session[:cart]).contents
    @contents = []
    @cart_total = 0
    outings.each do |outing_id, outing_qty|
      outing = Outing.find(outing_id)
      @contents << [outing, outing_qty]
      @cart_total += (outing.adjusted_cost * outing_qty)
    end
    @cart_total = number_to_currency(@cart_total)
  end

  def create
    outing = Outing.find(params[:outing_id])
    @cart = Cart.new(session[:cart])
    @cart.add_outing(outing.id)
    session[:cart] = @cart.contents
    redirect_to outings_path
  end
end