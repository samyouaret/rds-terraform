
resource "aws_db_instance" "postgres_instance" {
  # The name of the database to create when the DB instance is created.
  db_name = "orders_db"
  ## we use postgres
  engine         = "postgres"
  engine_version = "14"
  instance_class = "db.t3.micro"
  username       = var.db_username
  password       = var.db_password
  ## create a standby instance in diffrent AZ
  multi_az = true
  # only for this tutorial
  publicly_accessible = true
  # allow minor version upgrade
  auto_minor_version_upgrade = true
  # keep backup for 7 days
  backup_retention_period = 7
  db_subnet_group_name    = aws_db_subnet_group.rds_postgres.name
  vpc_security_group_ids  = [aws_security_group.postgres_sec_group.id]
  backup_window           = "07:00-09:00"
  # storage allocated is 20GB
  allocated_storage = 20
  storage_type      = "gp2"
  #  Database storage auto scales up to the 100GB
  max_allocated_storage = 100
  #  disable taking a final backup when we destroy the database(for this tutorial).
  skip_final_snapshot = true

}