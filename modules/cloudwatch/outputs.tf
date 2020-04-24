output "log_group" {
  value = element(concat(aws_cloudwatch_log_group.main.*.name, [""]), 0)
}