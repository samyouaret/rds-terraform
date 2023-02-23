
resource "aws_db_instance" "postgres_instance_replica" {
  # use order instance as the source of our read replica
  # db_name = "orders_db"
  instance_class = "db.t3.micro"
  replicate_source_db    = aws_db_instance.postgres_instance.identifier
  vpc_security_group_ids = [aws_security_group.postgres_sec_group.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
  apply_immediately      = true
  # engine, allocated_storage, username, and password
  ## will inherit them for primary instance
}
