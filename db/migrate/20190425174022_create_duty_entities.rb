class CreateDutyEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :duty_entities do |t|
      t.string :name
      t.timestamps
    end
  end
end
