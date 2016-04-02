class DropUnnecessaryColumns < ActiveRecord::Migration
  def change
    remove_column :flights, :year
    remove_column :flights, :quarter
    remove_column :flights, :origin
    remove_column :flights, :origin_city_name
    remove_column :flights, :origin_state
    remove_column :flights, :dest
    remove_column :flights, :dest_city_name
    remove_column :flights, :dest_state
    remove_column :flights, :dest_state_name
    remove_column :flights, :weather_delay
    remove_column :flights, :nas_delay
    remove_column :flights, :security_delay
    remove_column :flights, :late_aircraft_delay

  end
end
