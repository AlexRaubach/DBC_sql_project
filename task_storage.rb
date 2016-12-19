

require "sqlite3"


db = SQLite3::Database.new("tasks.db")


create_table = <<-SQL
	create table IF NOT EXISTS tasks(
		name varchar(255),
		email varchar(255),
		task varchar(255),
		task_catagory varchar(255),
		do_on date
	)
SQL



def add_task_to_db(db, user_name, email, task, task_details, do_on)
	db.execute(
		"Insert into tasks (name, email, task, task_details, do_on) VALUES (?, ?, ?, ?, ?)", [name, email, task, task_details, do_on] )
end



task_user_name = "Alex"
email_address = "Alex@AlexRaubach.com"

# ui

db.execute(create_table) 

puts "How many tasks would you like to input?"
loop_variable = gets.chomp.to_i


loop_variable.times do |i|

	puts "What do you want to be reminded about?"
	user_provided_task = gets.chomp

	puts "What details would you like to remind yourself about later?"
	user_provided_details = gets.chomp

	puts "When do you want to be reminded about #{user_provided_task}?"
	user_provided_date = gets.chomp


	add_task_to_db(db, task_user_name, email_address, user_provided_task, user_provided_details, user_provided_date)
end

puts "Have a good day"
