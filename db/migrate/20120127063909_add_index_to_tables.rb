class AddIndexToTables < ActiveRecord::Migration
  def change
  	add_index :events, :user_id
  	add_index :events_users, :event_id
  	add_index :events_users, :user_id
  end
end
