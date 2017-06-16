class AddActivatedToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :activated, :boolean, default: false
  end
end
