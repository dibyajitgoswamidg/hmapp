class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      
      t.string :first_name
      t.string :last_name
      t.string :contact_number, unique: true
      t.string :alternate_contact_number, unique: true
      t.string :email, unique: true
      t.string :address_line
      t.string :city
      t.string :country
      t.string :pincode
      t.references :employee_type
      t.timestamps
    end
  end
end
