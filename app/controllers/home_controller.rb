class HomeController < ApplicationController

  def index
    @flights = Flight.pluck(:id)
    @carriers = Carrier.all
  end

end


