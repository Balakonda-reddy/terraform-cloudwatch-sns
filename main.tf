
# Cloudwatch event rule

resource "aws_cloudwatch_event_rule" "rule" {
  name        = var.cloudwatch-rule
  description = "For testing"

  event_pattern = <<EOF
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EC2 Instance State-change Notification"
  ]
}
EOF
}

# Cloudwatch event target


resource "aws_cloudwatch_event_target" "sns" {
  rule      = aws_cloudwatch_event_rule.rule.name
  target_id = "SendToSNS"
  arn       = aws_sns_topic.topic-1.arn
}

# SNS topic

resource "aws_sns_topic" "topic-1" {
  name = var.sns-topic
}


resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.topic-1.arn
  protocol  = var.protocol
  endpoint  = var.protocol-endpoint
}