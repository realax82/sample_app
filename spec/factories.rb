FactoryGirl.define do
    factory :user do
	name 'First User'
	email 'fuser@mail.com'
	password 'foobar'
	password_confirmation 'foobar'
    end
end