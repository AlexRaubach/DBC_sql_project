

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



def add_task_to_db(db, name, email, task, task_catagory, do_on)
	db.execute(
		"Insert into tasks (name, email, task, task_catagory, do_on) VALUES (?, ?, ?, ?, ?)", [name, email, task, task_catagory, do_on] )
end




db.execute(create_table) 

