variable "aws_region" {
  description = "AWS region where the EC2 instance will be deployed"
  type        = string
  default     = "us-east-1"
  validation {
    condition     = can(regex("^([a-z]{2}-[a-z]+-[0-9]{1})$", var.aws_region))
    error_message = "Invalid AWS region format. Please provide a valid region in the format 'us-west-2'."
  }
}

variable "db_engine" {
  description = "Database engine (mysql or postgres)"
  type        = string
  default     = "aurora-mysql"
  validation {
    condition     = var.db_engine == "aurora-mysql" || var.db_engine == "aurora-postgresql"
    error_message = "Valid options are 'aurora-mysql or 'aurora-postgresql'"
  }
}

variable "backup_retention_period" {
  description = "Number of RDS instances in the cluster"
  type        = number
  default     = 30
  validation {
    condition     = var.backup_retention_period >= 0 && var.backup_retention_period <= 35
    error_message = "Invalid retention period. The value must be between 0 and 35 (inclusive)."
  }
}
variable "enable_performance_insights" {
  description = "Indicates whether Performance Insights will be enabled"
  type        = bool
  default     = true
}

variable "backtrack_window" {
  description = "Only for aurora MySQL, from 0 to 259200 seconds (72 hours), zero is disabled"
  type        = number
  default     = 86400

  validation {
    condition     = var.backtrack_window >= 0 && var.backtrack_window <= 259200
    error_message = "Must be between zero and 259200 (72 hours)"
  }

}

variable "enable_enhanced_monitoring" {
  description = "Indicates whether Enhanced Monitoring will be enabled"
  type        = bool
  default     = false
}

variable "enable_major_version_upgrade" {
  description = "Indicates whether major version upgrades are allowed"
  type        = bool
  default     = false
}

variable "instance_type" {
  description = "RDS instance type"
  type        = string
  default     = "db.t2.medium"
  validation {
    condition     = can(regex("^db\\.(t3|t2|t4g|c5|m5|r5|r6g|r6i|r7g|x2g)\\.", var.instance_type))
    error_message = "Invalid instance type. Supported types are db.t3.*, db.t2.*, db.c5.*, db.m5.*, db.r5.*"
  }
}

variable "kms_key_arn" {
  description = "KMS key ARN for encryption. 'create_kms_key' must be 'false'."
  type        = string
  default     = "arn:aws:kms:us-east-1:123456789012:key/e589fe53-4af7-b084-dad1-331b80f17860"
  validation {
    condition     = var.kms_key_arn == "" || can(regex("^arn:aws:kms:.*", var.kms_key_arn))
    error_message = "Invalid KMS key ARN. Please provide a valid ARN or leave it empty."
  }
}

variable "subnets" {
  description = "Subnets where the RDS instance will be deployed"
  type        = list(string)
  default     = ["subnet-12345678", "subnet-87654321"]
  validation {
    condition     = length(var.subnets) > 0
    error_message = "At least one subnet ID must be provided."
  }
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "mydatabase"
}

variable "db_username" {
  description = "Initial username"
  type        = string
  default     = "myuser"
}

variable "allowed_ip_addresses" {
  description = "Comma-separated list of allowed IP addresses for security group ingress"
  type        = string
  default     = "192.168.10.0/24"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "myproject"
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
  default     = "vpc-12345678"
  validation {
    condition     = can(regex("^vpc-[a-zA-Z0-9]+$", var.vpc_id))
    error_message = "Invalid VPC ID format. Please provide a valid VPC ID."
  }
}

variable "publicly_accessible" {
  description = "Indicates whether the RDS instance is publicly accessible"
  type        = bool
  default     = false
}

variable "instance_count" {
  description = "Number of RDS instances in the cluster"
  type        = number
  default     = 2
  validation {
    condition     = var.instance_count >= 1 && var.instance_count <= 16
    error_message = "Invalid instance count. The value must be between 2 and 16 (inclusive)."
  }
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to AWS resources"
  default = {
    Environment = "Development"
    Owner       = "Frankin Garcia"
  }
}