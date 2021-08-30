resource "aws_elasticache_replication_group" "general" {
  replication_group_id = var.replication_group_id
  replication_group_description = var.replication_group_description
  number_cache_clusters = var.number_cache_clusters
  node_type = var.node_type
  automatic_failover_enabled = var.automatic_failover_enabled
  multi_az_enabled = var.multi_az_enabled
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  availability_zones = var.availability_zones
  engine = var.engine
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  transit_encryption_enabled = var.transit_encryption_enabled
  auth_token = var.auth_token
  kms_key_id = var.kms_key_id
  engine_version = var.engine_version
  parameter_group_name = var.parameter_group_name
  port = var.port
  subnet_group_name = var.subnet_group_name
  security_group_names = var.security_group_names
  security_group_ids = var.security_group_ids
  snapshot_arns = var.snapshot_arns
  snapshot_name = var.snapshot_name
  maintenance_window = var.maintenance_window
  notification_topic_arn = var.notification_topic_arn
  snapshot_window = var.snapshot_window
  snapshot_retention_limit = var.snapshot_retention_limit
  apply_immediately = var.apply_immediately
  final_snapshot_identifier = var.final_snapshot_identifier
  
  dynamic cluster_mode {
    for_each = var.cluster_mode == null ? [] : list(var.cluster_mode)
    content {
      replicas_per_node_group = var.replicas_per_node_group
      num_node_groups = var.num_node_groups
    }
  }

  tags = var.tags
}