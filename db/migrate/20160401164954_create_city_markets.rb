class CreateCityMarkets < ActiveRecord::Migration
  def change
    create_table :city_markets do |t|
      t.string :target_geo_id
      t.integer :target_geo_id_2
      t.string :name
      t.integer :population

    end
  end
end
