class AddLastTimeSyncToUsers < ActiveRecord::Migration
  def change
     add_column :users, :last_time_sync, :datetime
     add_column :users, :toggl_api_key, :string
  end
end
