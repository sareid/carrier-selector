class Flight < ActiveRecord::Base


  def self.carrier_names
    Flight.pluck(:carrier).uniq.sort
  end

  def self.carrier_database
    carriers = Flight.carrier_names
    carriers.each do |name|
      properties = Flight.get_properties(name)
      carrier = Carrier.find_by(name: name)
      carrier.update(properties)
    end
  end

  def self.get_properties(name)
    properties = {}
    properties[:num_flights] = Flight.num_flights(name)
    properties[:num_cancelled_flights] = Flight.num_cancelled_flights(name)
    properties[:mean_ground_time_cancelled_flights] = Flight.mean_ground_time_cancelled_flights(name)
    properties[:num_delayed_flights] = Flight.num_delayed_flights(name)
    properties[:mean_delay_time] = Flight.mean_delay_time(name)
    properties[:standard_deviation] = Flight.standard_deviation(name)
    properties
  end

  def self.show_city_markets(carrier_name)
    markets = Flight.where(carrier: carrier_name).pluck(:dest_city_market, :origin_city_market).uniq
    markets.flatten!.uniq!
  end

  def self.num_flights(carrier_name)
    Flight.where(carrier: carrier_name).pluck(:id).length
  end

  def self.cancelled_flights(carrier_name)
    Flight.where(carrier: carrier_name).where(cancelled: true).where('cancellation_code = ?', "Carrier").pluck(:total_add_g_time)
  end

  def self.num_cancelled_flights(carrier_name)
    Flight.cancelled_flights(carrier_name).length
  end

  def self.mean_ground_time_cancelled_flights(carrier_name)
    cancellations = Flight.cancelled_flights(carrier_name).compact
    Flight.mean(cancellations)
  end

  def self.delayed_flights(carrier_name)
    Flight.where(carrier: carrier_name).where('carrier_delay > 0').pluck(:carrier_delay)
  end

  def self.num_delayed_flights(carrier_name)
    Flight.delayed_flights(carrier_name).length
  end

  def self.mean_delay_time(carrier_name)
    delays = Flight.delayed_flights(carrier_name)
    Flight.mean(delays)
  end

  def self.mean(array)
    array.inject(0) { |sum, x| sum += x } / array.size.to_f
  end

  def self.standard_deviation(carrier_name)
    delays = Flight.delayed_flights(carrier_name)
    deviances = delays.map do |delay|
      delay * delay
    end
    mean = Flight.mean(deviances)
    Math.sqrt(mean).round(2)
  end

  def self.flights_per_carrier_chart_data
    data = []
    Carrier.all.each do |carrier|
      data << {
        value: carrier.num_flights,
        color: carrier.colour,
        highlight: carrier.colour,
        label: carrier.name
      }
    end
    data
  end

  def self.flights_per_carrier_chart_options
    options = {
      animationEasing: "easeInCubic",
      width: 350,
      height: 350
    }
    options
  end

  def self.number_of_destinations_data
    data = {
      labels: [],
      datasets: [{
          label: "Number of destinations served by each carrier",
          fillColor: "rgba(240,95,64,0.5)",
          strokeColor: "rgba(240,95,64,0.8)",
          highlightFill: "rgba(240,95,64,0.75)",
          highlightStroke: "rgba(240,95,64,1)",
          data: []
        }]
      }
    Carrier.all.each do |carrier|
      data[:labels] << carrier.name
      total = 0
      markets = Flight.show_city_markets(carrier.name).length
      total += markets
      data[:datasets][0][:data] << total
    end
    data
  end

end
