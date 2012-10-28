class TimeEntry < ActiveRecord::Base
  attr_accessible :description, :duration, :start_time, :end_time, :reviewed, :synced, :date
  belongs_to :user
end
