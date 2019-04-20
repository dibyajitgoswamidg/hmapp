class CreateBillingEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :billing_entities do |t|

      t.string :name
      t.timestamps
    end
  end
end
