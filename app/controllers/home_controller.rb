class HomeController < ApplicationController

  def index
    @flights = Flight.pluck(:id)
    @carriers = Carrier.all
    # @total_number_flights =
  end

end



# 1.  Frontier Airlines Inc = 19 282 flights
# 2.  Hawaiian Airlines Inc. = 18 182 flights
# 3.  Alaska Airlines Inc. = 35 682 flights
# 4.  American Airlines Inc. = 244 056 flights
# 5.  US Airways Inc. = 98 122 flights
# 6.  Virgin America = 13 750 flights
# 7.  Mesa Airlines Inc. = 31 298 flights
# 8.  Delta Air Lines Inc. = 184 774 flights
# 9.  Southwest Airlines Co. = 275 827 flights
# 10. ExpressJet Airlines Inc. = 185 632 flights
# 11. SkyWest Airlines Inc. = 151 396
# 12. AirTran Airways Corporation = 49 288
# 1.  United Air Lines Inc. = 128 368
# 2.  JetBlue Airways = 55 489

