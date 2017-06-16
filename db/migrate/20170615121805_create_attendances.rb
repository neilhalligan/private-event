class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :attendee, index: true
      t.references :event, index: true

      t.timestamps
    end
    add_foreign_key :attendances, :users, column: :attendee_id
    add_foreign_key :attendances, :events
  end
end
