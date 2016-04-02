class CreateTechnicalReports < ActiveRecord::Migration
  def change
    create_table :technical_reports do |t|

      t.timestamps null: false
    end
  end
end
