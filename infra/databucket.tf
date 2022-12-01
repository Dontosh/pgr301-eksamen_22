# Jim; this just fails ... commented it out ! We need to figure this out later, starting new task instead...

resource "aws_s3_bucket" "analyticsbucket-1049" {
  bucket = "analytics-${var.candidate_id}"
}
// test