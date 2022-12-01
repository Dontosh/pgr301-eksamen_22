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
            "carts.value"
          ]
        ],
        "period": 5,
        "unit": "Carts",
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
            "checkouts.value"
          ]
        ],
        "period": 5,
        "unit": "Carts",
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total number of checkouts"
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
            "checkouts_latency"
          ]
        ],
        "period": 5,
        "unit": "Time",
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Checkouts latency"
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
            "cartsvalue.value"
          ]
        ],
        "period": 5,
        "unit": "CHECKOUTS",
        "stat": "Maximum",
        "region": "eu-west-1",
        "title": "Total value in cart"
      }
    }
  ]
}
BODY
}