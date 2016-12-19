
require "sqlite3"

require 'date'

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

date_of_today = Date.today


current_tasks = db.execute( <<-SQL 
SELECT * FROM tasks ORDER By do_on ASC LIMIT 3
SQL
)

p current_tasks


i = 0
while i < 3 #limit of 3 emails to prevent spamming myself
	user_name = current_tasks[i][0]
	email = current_tasks[i][1]
	task = current_tasks[i][2]
	task_details = current_tasks[i][3]
	do_on = current_tasks[i][4]
	row_id = current_tasks[i][5]

	do_on = Date.parse(do_on)

	if do_on <= date_of_today

		Mail.deliver do
			from 'alex@alexraubach.com'
			to    "#{email}"
			subject "Don't forget about #{task}"
			body   "Hey #{user_name} 
			Here's your automatic reminder: 
			#{task_details}
			Sincerely, reminder bot"
		end

		db.execute( "
			DELETE FROM tasks WHERE id = #{row_id} "
			)
	else
		break 
	end

	i+=1
end