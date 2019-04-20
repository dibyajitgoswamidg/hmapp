class CreateWards < ActiveRecord::Migration[5.2]
  def change
    create_table :wards do |t|

      t.string :name
      t.string :number
      t.string :description
      t.references :ward_type
      t.timestamps
    end
  end
end
