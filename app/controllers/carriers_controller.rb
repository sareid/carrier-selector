class CarriersController < ApplicationController

  def index
    @carriers = Carrier.all
  end

  def show
    @carrier = Carrier.find
  end


end
