

# Preparing the environment

1. Clone the repository using `git`
```bash
git clone the-repository/project
```
2. Change to the project directory
```bash
cd project/
```
3. Init the Terraform project
```bash
terraform init
```
4. Validate the configurations files
```bash
terraform validate
```
5. Lint the project

Installation guide for tflint -> https://github.com/terraform-linters/tflint
```bash
tflint
```
6. Validate for security best practices

Installation guide for tfsec -> https://aquasecurity.github.io/tfsec/v1.28.1/guides/installation/
```bash
tfsec
```
7. Give some format (just in case)
```bash
terraform fmt
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.3.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 5.3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | = 3.5.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_subnet_group.aurora_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/5.3.0/docs/resources/db_subnet_group) | resource |
| [aws_rds_cluster.aurora](https://registry.terraform.io/providers/hashicorp/aws/5.3.0/docs/resources/rds_cluster) | resource |
| [aws_rds_cluster_instance.aurora_cluster_instance](https://registry.terraform.io/providers/hashicorp/aws/5.3.0/docs/resources/rds_cluster_instance) | resource |
| [aws_rds_cluster_parameter_group.aurora](https://registry.terraform.io/providers/hashicorp/aws/5.3.0/docs/resources/rds_cluster_parameter_group) | resource |
| [aws_secretsmanager_secret.aurora_password_secret](https://registry.terraform.io/providers/hashicorp/aws/5.3.0/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.aurora_password_version](https://registry.terraform.io/providers/hashicorp/aws/5.3.0/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.aurora_sg](https://registry.terraform.io/providers/hashicorp/aws/5.3.0/docs/resources/security_group) | resource |
| [random_id.id](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/id) | resource |
| [random_password.aurora_password](https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/password) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/5.3.0/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_ip_addresses"></a> [allowed\_ip\_addresses](#input\_allowed\_ip\_addresses) | Comma-separated list of allowed IP addresses for security group ingress | `string` | `""` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region where the EC2 instance will be deployed | `string` | `"us-east-1"` | no |
| <a name="input_backtrack_window"></a> [backtrack\_window](#input\_backtrack\_window) | Only for aurora MySQL, from 0 to 259200 seconds (72 hours), zero is disabled | `number` | `86400` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | Number of RDS instances in the cluster | `number` | `30` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | Database engine (mysql or postgres) | `string` | `"aurora-mysql"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Initial database name | `string` | `"mydatabase"` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Initial username | `string` | `"myuser"` | no |
| <a name="input_enable_enhanced_monitoring"></a> [enable\_enhanced\_monitoring](#input\_enable\_enhanced\_monitoring) | Indicates whether Enhanced Monitoring will be enabled | `bool` | `false` | no |
| <a name="input_enable_major_version_upgrade"></a> [enable\_major\_version\_upgrade](#input\_enable\_major\_version\_upgrade) | Indicates whether major version upgrades are allowed | `bool` | `false` | no |
| <a name="input_enable_performance_insights"></a> [enable\_performance\_insights](#input\_enable\_performance\_insights) | Indicates whether Performance Insights will be enabled | `bool` | `true` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of RDS instances in the cluster | `number` | `2` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | RDS instance type | `string` | `"db.t2.medium"` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | KMS key ARN for encryption | `string` | `"arn:aws:kms:us-east-1:123456789012:key/e589fe53-4af7-b084-dad1-331b80f17860"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"myproject"` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Indicates whether the RDS instance is publicly accessible | `bool` | `false` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets where the RDS instance will be deployed | `list(string)` | <pre>[<br>  "subnet-12345678",<br>  "subnet-87654321"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to AWS resources | `map(string)` | <pre>{<br>  "Environment": "Development",<br>  "Owner": "Frankin Garcia"<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC | `string` | `"vpc-12345678"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Endpoint of the Aurora cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID of the Aurora cluster |
| <a name="output_cluster_username"></a> [cluster\_username](#output\_cluster\_username) | Username of the Aurora cluster |


