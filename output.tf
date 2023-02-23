
# get the databse url after creating DB
output "rds_instance_connection_url" {
  value = aws_db_instance.postgres_instance.endpoint
}

output "rds_replica_connection_parameters" {
  description = "RDS replica instance connection parameters"
  value       = "${aws_db_instance.postgres_instance_replica.address} -p ${aws_db_instance.postgres_instance_replica.port} , ${aws_db_instance.postgres_instance_replica.username}"
}
