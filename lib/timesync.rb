require 'net/http'
require 'uri'
require 'active_support'

class TimeSync
	def get_time(toggle_api, start_date = nil, end_date = nil)
		start_date ||= Date.today
		end_date ||= start_date + 1
		uri = URI.parse("https://www.toggl.com/api/v6/time_entries.json?start_date=#{start_date}&end_date=#{end_date}")
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		req = Net::HTTP::Get.new(uri.request_uri)
		req.basic_auth toggle_api, "api_token"
		resp = http.request(req)
		ActiveSupport::JSON.decode(resp.body)
	end
end
