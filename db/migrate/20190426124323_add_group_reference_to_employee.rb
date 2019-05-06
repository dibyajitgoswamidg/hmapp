class AddGroupReferenceToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :group, index: true
  end
end
