class AddAnalyzeColumnToCarriers < ActiveRecord::Migration
  def change
    add_column :carriers, :analyzed, :boolean, :default => false
  end
end
