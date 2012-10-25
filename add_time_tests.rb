require 'add_time'

describe AddTime do
	it "logs into bigtime" do
	at = AddTime.new
	at.login
	expect(at.url).to.be eq "http://www.bigtime.com/"
	end
end
