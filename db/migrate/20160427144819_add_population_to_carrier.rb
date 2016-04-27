class AddPopulationToCarrier < ActiveRecord::Migration
  def change
    add_column :carriers, :population, :integer
  end
end
