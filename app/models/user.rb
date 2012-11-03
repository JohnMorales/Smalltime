require 'timesync'

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :last_time_sync, :toggl_api_key
  has_many :time_entries
  def get_time_entries()
    time_sync = TimeSync.new
    time_sheets = time_sync.get_time toggl_api_key, (last_time_sync || Date.today.prev_year), Date.today
    time_sheets['data'].each do |f|
      time_entry = time_entries.create
      time_entry.description = f['description']
      start_time = (DateTime.parse f['start'])
      time_entry.start_time = start_time.to_time
      time_entry.date = start_time.to_date
      time_entry.end_time = (DateTime.parse f['stop']).to_time
      time_entry.duration = f['duration']
      time_entry.save!
    end
    self.last_time_sync = DateTime.now
    save!
  end

  def get_dates_and_durations
    dates = Hash.new(0)
    time_entries.each { |entry| dates[entry.date.to_s] += entry.duration.to_f }
    dates  
  end
end
