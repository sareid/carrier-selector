class CarriersController < ApplicationController

  def index
    @carriers = Carrier.all
  end

  def show
    @carrier = Carrier.find(params[:id])
    @flights = Flight.where(carrier: @carrier.name)
    @metros = Flight.show_city_markets(@carrier.name)
    @flight_breakdown_data = @carrier.num_delayed_flights_data
    @flight_delay_data = @carrier.delay_time_data
  end


end
