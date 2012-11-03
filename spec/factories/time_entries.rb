# Read about factories at https://github.com/thoughtbot/factory_girl
require 'active_support/core_ext/numeric/time'


FactoryGirl.define do

  sequence(:random_date) {|n| rand(50).days.ago }
  
  factory :time_entry do
  	description "FB99990 - Sample time entry."
  	duration { rand 5.0 }

  	date { generate(:random_date) }
  	user
  end
end
