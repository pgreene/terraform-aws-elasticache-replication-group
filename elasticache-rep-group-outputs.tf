output "arn" {
    value = aws_elasticache_replication_group.general.arn
}

output "id" {
    value = aws_elasticache_replication_group.general.id
}

output "cluster_enabled" {
    value = aws_elasticache_replication_group.general.cluster_enabled
}

output "configuration_endpoint_address" {
    value = aws_elasticache_replication_group.general.configuration_endpoint_address
}

output "primary_endpoint_address" {
    value = aws_elasticache_replication_group.general.primary_endpoint_address
}

output "reader_endpoint_address" {
    value = aws_elasticache_replication_group.general.reader_endpoint_address
}

output "member_clusters" {
    value = aws_elasticache_replication_group.general.member_clusters
}