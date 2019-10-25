provider "aws" {
    profile =    "cfg-innovation-lab"
    shared_credentials_file = ".ssh/.aws/credentials"
    region = "us-east-1"
}
resource "aws_cloudwatch_metric_alarm" "Citizens-EC2-CPUUtilization-Alarm" {
  alarm_name                = "terraform-EC2-CPUUtilization-Alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []
}
