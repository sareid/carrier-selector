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
    labels: ["Mean delay time", "Mean ground time for cancelled flight"],
    datasets: [
        {
            label: "Mean delay and cancellation times",
            fillColor: "rgba(240,95,64,0.5)",
            strokeColor: "rgba(240,95,64,0.8)",
            highlightFill: "rgba(240,95,64,0.75)",
            highlightStroke: "rgba(240,95,64,1)",
            data: [self.mean_delay_time, self.mean_ground_time_cancelled_flights]
        },

    ]
};

  end

end
