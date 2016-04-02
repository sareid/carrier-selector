class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :name
      t.integer :num_flights
      t.integer :num_cancelled_flights
      t.float :mean_ground_time_cancelled_flights
      t.integer :num_delayed_flights
      t.float :mean_delay_time

      t.timestamps null: false
    end
  end
end
