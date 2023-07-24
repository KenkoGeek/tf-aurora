output "aurora_cluster_id" {
  value       = aws_rds_cluster.aurora.id
  description = "ID of the Aurora cluster"
}

output "aurora_cluster_endpoint" {
  value       = aws_rds_cluster.aurora.endpoint
  description = "Endpoint of the Aurora cluster"
}

output "aurora_cluster_username" {
  value       = aws_rds_cluster.aurora.master_username
  description = "Username of the Aurora cluster"
}

output "aurora_cluster_port" {
  value       = aws_rds_cluster.aurora.port
  description = "Aurora connection port."
}
