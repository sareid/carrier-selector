class Carrier < ActiveRecord::Base
  validates_uniqueness_of :name

  def num_delayed_flights_data

    data = [
      {
          value: (self.num_flights - (self.num_cancelled_flights + self.num_delayed_flights)),
          color:"#5B9632",
          highlight: "#85BC5E",
          label: "Normal flights"
      },
      {
          value: self.num_cancelled_flights,
          color: "#74132D",
          highlight: "#9A334F",
          label: "Cancelled flights"
      },
      {
          value: self.num_delayed_flights,
          color: "#AA9339",
          highlight: "#D4BF6A",
          label: "Delayed flights"
      }
    ]
    data
  end

  def delay_time_data
    data = {
    labels: ["Delays", "Cancellations"],
    datasets: [
        {
            label: "Mean delay and cancellation times",
            fillColor: "rgba(240,95,64,0.5)",
            strokeColor: "rgba(240,95,64,0.8)",
            highlightFill: "rgba(240,95,64,0.75)",
            highlightStroke: "rgba(240,95,64,1)",
            data: [self.mean_delay_time.round(2), self.mean_ground_time_cancelled_flights.round(2)]
        },

    ]
};

  end

  def self.assign_city_markets(carrier)
    data = {
      "type" => "FeatureCollection",
      "features" => []
    }
    cities = Flight.show_city_markets(carrier.name)
    cities.each do |city|
      city_market = CityMarket.find_by(name: city)
      if city_market
        city_data = {
          "type": "Feature",
          "id": city_market[:id].to_s,
          "geometry": {
            "type": "Point",
            "coordinates":[-(city_market[:longitude]), city_market[:latitude]]
          },
          "properties": {
            "name": city_market[:name],
            "population": city_market[:population]
          }
        }
        data["features"] << city_data
      end
    end
    data
  end

  def self.assign_populations
    carriers = Carrier.all
    carriers.each do |carrier|
      pop = 0
      cities = Flight.show_city_markets(carrier.name)
      cities.each do |city|
        city_market = CityMarket.find_by(name: city)
        if city_market
          pop += city_market[:population]
        end
      end
      carrier[:population] = pop
      carrier.save
    end
  end

end
