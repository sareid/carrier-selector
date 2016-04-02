class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|

      t.integer :year
      t.integer :quarter
      t.integer :month
      t.integer :day_of_month
      t.integer :day_of_week
      t.datetime :flight_date
      t.string :carrier
      t.string :tail_num
      t.integer :flight_num
      t.string :origin
      t.string :origin_city_name
      t.string :origin_city_market
      t.string :origin_state
      t.string :origin_state_name
      t.string :dest
      t.string :dest_city_name
      t.string :dest_city_market
      t.string :dest_state
      t.string :dest_state_name
      t.integer :crs_dep_time
      t.integer :dep_time
      t.integer :dep_delay
      t.string :dep_time_blk
      t.integer :taxi_out
      t.integer :wheels_off
      t.integer :wheels_on
      t.integer :taxi_in
      t.integer :crs_arr_time
      t.integer :arr_time
      t.integer :arr_delay
      t.string :arr_time_blk
      t.boolean :cancelled
      t.string :cancellation_code
      t.integer :crs_elapsed_time
      t.integer :actual_elapsed_time
      t.integer :air_time
      t.integer :flights
      t.integer :distance
      t.integer :carrier_delay
      t.integer :weather_delay
      t.integer :nas_delay
      t.integer :security_delay
      t.integer :late_aircraft_delay
      t.integer :first_dep_time
      t.integer :total_add_g_time
      t.integer :longest_add_g_time

    end
  end
end
