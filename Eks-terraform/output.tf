
output "cluster_name" {
  value = aws_eks_cluster.example.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "cluster_security_group_id" {
  value = aws_eks_cluster.example.vpc_config[0].cluster_security_group_id
}

output "cluster_certificate_authority_data" {
  value = aws_eks_cluster.example.certificate_authority.0.data
}

output "node_group_name" {
  value = aws_eks_node_group.example.node_group_name
}

output "node_group_arn" {
  value = aws_eks_node_group.example.arn
}

output "node_group_security_group_id" {
  value = aws_eks_node_group.example.remote_access_security_group_id
}

output "node_group_autoscaling_groups" {
  value = aws_eks_node_group.example.autoscaling_groups
}

output "node_group_instance_types" {
  value = aws_eks_node_group.example.instance_types
}

output "node_group_desired_capacity" {
  value = aws_eks_node_group.example.scaling_config[0].desired_size
}

output "node_group_min_size" {
  value = aws_eks_node_group.example.scaling_config[0].min_size
}

output "node_group_max_size" {
  value = aws_eks_node_group.example.scaling_config[0].max_size
}

output "node_group_subnet_ids" {
  value = aws_eks_node_group.example.subnet_ids
}

output "node_group_instance_types" {
  value = aws_eks_node_group.example.instance_types
}

output "node_group_key_name" {
  value = aws_eks_node_group.example.key_name
}

output "node_group_version" {
  value = aws_eks_node_group.example.version
}

output "node_group_status" {
  value = aws_eks_node_group.example.status
}

output "node_group_cluster_name" {
  value = aws_eks_node_group.example.cluster_name
}

output "node_group_node_role_arn" {
  value = aws_eks_node_group.example.node_role_arn
}

output "node_group_launch_template" {
  value = aws_eks_node_group.example.launch_template
}

output "node_group_remote_access" {
  value = aws_eks_node_group.example.remote_access
}

output "node_group_scaling_config" {
  value = aws_eks_node_group.example.scaling_config
}

output "node_group_instance_types" {
  value = aws_eks_node_group.example.instance_types
}

output "node_group_disk_size" {
  value = aws_eks_node_group.example.disk_size
}

output "node_group_labels" {
  value = aws_eks_node_group.example.labels
}

output "node_group_tags" {
  value = aws_eks_node_group.example.tags
}

output "node_group_taints" {
  value = aws_eks_node_group.example.taints
}

output "node_group_update_config" {
  value = aws_eks_node_group.example.update_config
}

output "node_group_version" {
  value = aws_eks_node_group.example.version
}

output "node_group_encryption_config" {
  value = aws_eks_node_group.example.encryption_config
}

output "node_group_kubelet_extra_args" {
  value = aws_eks_node_group.example.kubelet_extra_args
}

output "node_group_status" {
  value = aws_eks_node_group.example.status
}

output "node_group_arn" {
  value = aws_eks_node_group.example.arn
}

output "node_group_created_at" {
  value = aws_eks_node_group.example.created_at
}

output "node_group_modified_at" {
  value = aws_eks_node_group.example.modified_at
}

output "node_group_node_group_name" {
  value = aws_eks_node_group.example.node_group_name
}

output "node_group_node_instance_role" {
  value = aws_eks_node_group.example.node_instance_role
}

