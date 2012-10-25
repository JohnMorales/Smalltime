require "selenium-webdriver"

class AddTime
	def initialize()
		@driver = Selenium::WebDriver.for :firefox
		@driver.manage.timeouts.implicit_wait = 3  #seconds
		@driver.navigate.to "http://time.arpc.com"
	end
	def login()
		form = @driver.find_element(:id, "frmLOGIN")
		name = form.find_element(:name, "fldUNM");
		passwrd = form.find_element(:name, "fldPWD");
		name.send_keys "j.morales@arpc.com"
		passwrd.send_keys  "yagni"
	end
	def url
		@driver.url
	end
	def goto_worksheet(week)
		go = form.find_element(:name, "cmdGO")
		go.submit
		daily_routine = driver.find_element(:id, "CodeThat6")
		driver.action.move_to(daily_routine).perform
		current_timesheet_button = driver.find_element(:id, "CodeThat38")
		current_timesheet_button.click
	end
end
