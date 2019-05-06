class AddSplitStartToShift < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :split_start, :time
  end
end
