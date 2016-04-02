class Route < ActiveRecord::Base
  belongs_to :origin_city_market, class_name: "CityMarket"
  belongs_to :dest_city_market, class_name: "CityMarket"
  belongs_to :carrier
end
