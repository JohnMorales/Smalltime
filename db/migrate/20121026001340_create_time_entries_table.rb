class CreateTimeEntriesTable < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.string :description
      t.decimal :duration
      t.date    :date
      t.time    :start_time
      t.time    :end_time
      t.boolean :reviewed
      t.boolean :synced
      t.belongs_to :users
      t.timestamps
    end
  end
end
