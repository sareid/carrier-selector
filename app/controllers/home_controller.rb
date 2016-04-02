class HomeController < ApplicationController

  def index
    @flights = Flight.pluck(:id)
    @carriers = Carrier.all
    @total_flight_data = Flight.flights_per_carrier_chart_data
    @total_flight_options = Flight.flights_per_carrier_chart_options
  end

end


