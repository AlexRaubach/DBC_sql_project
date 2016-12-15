

require "sqlite3"


db = db.execute <<-SQL
	create table tasks (
	name varchar(255),
	email varchar(255),
	task varchar(255),
	do_on date

	);
SQL



