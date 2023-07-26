 
output "cluster_name" {
  value = aws_eks_cluster.graylog
}

output "cluster_endpoint" {
  value = aws_eks_cluster.graylog.endpoint
}

output "cluster_ca_certificate" {
  value = aws_eks_cluster.graylog.certificate_authority[0].data
} 