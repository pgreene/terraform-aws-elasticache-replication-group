variable "tags" {
  default = {}
}

variable "replication_group_id" {
  description = "(Required) The replication group identifier. This parameter is stored as a lowercase string."
  default = null
}

variable "replication_group_description" {
  description = "(Required) A user-created description for the replication group."
  default = "Replication Group Description"
}

variable "number_cache_clusters" {
  description = "(Optional) The number of cache clusters (primary and replicas) this replication group will have. If Multi-AZ is enabled, the value of this parameter must be at least 2. Updates will occur before other modifications. One of number_cache_clusters or cluster_mode is required."
  default = null
}

variable "node_type" {
  description = "(Required) The instance class to be used. See AWS documentation for information on supported node types and guidance on selecting node types."
  default = null
}

variable "automatic_failover_enabled" {
  description = "(Optional) Specifies whether a read-only replica will be automatically promoted to read/write primary if the existing primary fails. If true, Multi-AZ is enabled for this replication group. If false, Multi-AZ is disabled for this replication group. Must be enabled for Redis (cluster mode enabled) replication groups. Defaults to false"
  default = false
}

variable "multi_az_enabled" {
  description = "(Optional) Specifies whether to enable Multi-AZ Support for the replication group. If true, automatic_failover_enabled must also be enabled. Defaults to false."
  default = false
}

variable "auto_minor_version_upgrade" {
  description = "(Optional) Specifies whether a minor engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. This parameter is currently not supported by the AWS API. Defaults to true."
  default = true
}

variable "availability_zones" {
  description = "(Optional) A list of EC2 availability zones in which the replication group's cache clusters will be created. The order of the availability zones in the list is not important."
  default = null
}

variable "engine" {
  description = "(Optional) The name of the cache engine to be used for the clusters in this replication group. The only valid value is redis."
  default = "redis"
}

variable "at_rest_encryption_enabled" {
  description = "(Optional) Whether to enable encryption at rest."
  default = null
}

variable "transit_encryption_enabled" {
  description = "(Optional) Whether to enable encryption in transit."
  default = null
}

variable "auth_token" {
  description = "(Optional) The password used to access a password protected server. Can be specified only if transit_encryption_enabled = true."
  default = null
}

variable "kms_key_id" {
  description = "(Optional) The ARN of the key that you wish to use if encrypting at rest. If not supplied, uses service managed encryption. Can be specified only if at_rest_encryption_enabled = true."
  default = null
}

variable "engine_version" {
  description = "(Optional) The version number of the cache engine to be used for the cache clusters in this replication group."
  default = null
}

variable "parameter_group_name" {
  description = "(Optional) The name of the parameter group to associate with this replication group. If this argument is omitted, the default cache parameter group for the specified engine is used. To enable cluster mode, i.e. data sharding, use a parameter group that has the parameter cluster-enabled set to true."
  default = null
}

variable "port" {
  description = "(Optional) The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379."
  default = 6379
}

variable "subnet_group_name" {
  description = "(Optional) The name of the cache subnet group to be used for the replication group."
  default = null
}

variable "security_group_names" {
  description = "(Optional) A list of cache security group names to associate with this replication group."
  default = null
}

variable "security_group_ids" {
  description = "(Optional) One or more Amazon VPC security groups associated with this replication group. Use this parameter only when you are creating a replication group in an Amazon Virtual Private Cloud."
  default = null
}

variable "snapshot_arns" {
  description = "(Optional) A list of Amazon Resource Names (ARNs) that identify Redis RDB snapshot files stored in Amazon S3. The names object names cannot contain any commas."
  default = null
}

variable "snapshot_name" {
  description = "(Optional) The name of a snapshot from which to restore data into the new node group. Changing the snapshot_name forces a new resource."
  default = null
}

variable "maintenance_window" {
  description = "(Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00"
  default = null
}

variable "notification_topic_arn" {
  description = "(Optional) An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic"
  default = null
}

variable "snapshot_window" {
  description = "(Optional, Redis only) The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. The minimum snapshot window is a 60 minute period. Example: 05:00-09:00"
  default = null
}

variable "snapshot_retention_limit" {
  description = "(Optional, Redis only) The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro cache nodes"
  default = null
}

variable "apply_immediately" {
  description = "(Optional) Specifies whether any modifications are applied immediately, or during the next maintenance window. Default is false."
  default = false
}

variable "final_snapshot_identifier" {
  description = "(Optional) The name of your final node group (shard) snapshot. ElastiCache creates the snapshot from the primary node in the cluster. If omitted, no final snapshot will be made."
  default = null
}

variable "cluster_mode" {
  description = "(Optional) Create a native Redis cluster. automatic_failover_enabled must be set to true. Cluster Mode documented below. Only 1 cluster_mode block is allowed. One of number_cache_clusters or cluster_mode is required. Note that configuring this block does not enable cluster mode, i.e. data sharding, this requires using a parameter group that has the parameter cluster-enabled set to true."
  default = null
}

variable "replicas_per_node_group" {
  description = "(Required) Specify the number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will trigger an online resizing operation before other settings modifications."
  default = null
}

variable "num_node_groups" {
  description = "(Required) Specify the number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications."
  default = null
}
