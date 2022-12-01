resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = var.candidate_id
  dashboard_body = <<BODY
{
  "widgets": [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "carts_count"
          ]
        ],
        "period": 30,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total number of carts"
      }
    },
{
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 12,
      "height": 6,
      "properties": {
        "metrics": [
          [
            "${var.candidate_id}",
            "cartsvalue"
          ]
        ],
        "period": 30,
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total value in cart"
      }
    }
  ]
}
BODY
}