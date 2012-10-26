class TimeEntry < ActiveRecord::Base
  attr_accessible :description, :duration, :start_time, :end_time, :reviewed, :synced
  belongs_to :user
end
