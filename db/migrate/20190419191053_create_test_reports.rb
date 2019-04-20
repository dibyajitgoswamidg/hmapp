class CreateTestReports < ActiveRecord::Migration[5.2]
  def change
    create_table :test_reports do |t|

      t.string :name
      t.string :description
      t.references :patient_entry
      t.timestamps
    end
  end
end
