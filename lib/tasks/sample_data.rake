namespace :db do
    desc 'Fill database with sample data'
    task(populate: :environment) do
	users=User.all
	30.times do |n|
	    users.each {|user| user.microposts.create!(content: "#{user.name} #{n} post \n************************************************************************")}
	end
    end
end