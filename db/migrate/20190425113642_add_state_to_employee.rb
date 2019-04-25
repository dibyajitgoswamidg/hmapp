class AddStateToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :state, :string
  end
end
