require './timesync'

describe TimeSync do
	it "should get time from toggle" do
		time_sync = TimeSync.new	
		time_sheets = time_sync.get_time "b00f3d412d61e93c2f2c4627e944824f"
		time_sheets.count.should be > 1
		time_sheets['data'].each do |f|
			time_entry = DateTime.parse f['start']
			time_entry.to_date.should eq Date.today
		end
	end
	it "should get yesterday's time from toggle" do
		time_sync = TimeSync.new	
		yesterday = Date.today - 1
		time_sheets = time_sync.get_time "b00f3d412d61e93c2f2c4627e944824f", yesterday
		time_sheets.count.should be > 1
		time_sheets['data'].each do |f|
			time_entry = DateTime.parse f['start']
			time_entry.to_date.should eq yesterday
			p f['description']
		end
	end
end
