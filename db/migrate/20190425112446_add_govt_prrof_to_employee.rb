class AddGovtPrrofToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :govt_id_type, :string
    add_column :employees, :govt_id, :string
  end
end
