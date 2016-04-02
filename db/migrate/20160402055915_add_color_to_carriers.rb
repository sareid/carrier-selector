class AddColorToCarriers < ActiveRecord::Migration
  def change
    add_column :carriers, :colour, :string
  end
end
