# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
    factory :user_with_time_entries do
    	ignore do
    		entry_count 10
    	end
    	after(:create) do |user, evaluator|
    		FactoryGirl.create_list(:time_entry, evaluator.entry_count, {user: user })
    	end
    end
  end
end