output "cluster_id" {
  value       = aws_rds_cluster.aurora.id
  description = "ID of the Aurora cluster"
}

output "cluster_endpoint" {
  value       = aws_rds_cluster.aurora.endpoint
  description = "Endpoint of the Aurora cluster"
}

output "cluster_username" {
  value       = aws_rds_cluster.aurora.master_username
  description = "Username of the Aurora cluster"
}

