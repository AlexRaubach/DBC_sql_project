
require_relative "gmail.rb" #this contains my gmail user name and password, so I'm not uploading it to github. 

# Here's the contents of that file minus my gmail credentials: 

	# require 'mail'
	# options = { :address              => "smtp.gmail.com",
	#             :port                 => 587,
	#             :domain               => 'alexraubach.com',
	#             :user_name            => '<username>',
	#             :password             => '<password>',
	#             :authentication       => 'plain',
	#             :enable_starttls_auto => true  }
	            
	# Mail.defaults do
	#   delivery_method :smtp, options
	# end


db = SQLite3::Database.new("tasks.db")

date_of_today = Time.now


current_tasks = db.execute( <<-SQL 
SELECT * FROM tasks ORDER By do_on ASC LIMIT 3

SQL

)

p current_tasks