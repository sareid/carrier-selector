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
    @metro_data = Carrier.assign_city_markets(@carrier)
  end

  def data
    @carrier = Carrier.find(params["id"].to_i)
    respond_to do |format|
      format.json {
        render :json => Carrier.assign_city_markets(@carrier)
      }
    end
  end

  def usData
    @data = File.read("public/us.json")
    respond_to do |format|
      format.json {
        render :json => @data
      }
    end
  end

end
