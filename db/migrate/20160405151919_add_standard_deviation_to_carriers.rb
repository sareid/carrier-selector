class AddStandardDeviationToCarriers < ActiveRecord::Migration
  def change
    add_column :carriers, :standard_deviation, :float
  end
end
