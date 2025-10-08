resource "aws_db_instance" "main" {
	allocated_storage = 10
	db_name = "aws_estate"
	engine = "mysql"
	engine_version = "8.0"
	instance_class = "db.t3.micro"
	parameter_group_name = "aws_estate.mysql8.0"
	skip_final_snapshot = true
	# Wont configure a username a password just yet
}
