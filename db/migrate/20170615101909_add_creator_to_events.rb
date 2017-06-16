class AddCreatorToEvents < ActiveRecord::Migration[5.1]
  def change
    # add_column :events
    add_reference :events, :creator, index: true #, foreign_key: true
    add_foreign_key :events, :users, column: :creator_id
  end
end
