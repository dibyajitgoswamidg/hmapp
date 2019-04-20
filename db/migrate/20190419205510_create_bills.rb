class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|

      t.integer :amount
      t.references :billing_entity
      t.references :patient_entry
      t.timestamps
    end
  end
end
