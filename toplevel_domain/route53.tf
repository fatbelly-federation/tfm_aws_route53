### create this top-level domain ###
# ref: https://www.terraform.io/docs/providers/aws/r/route53_zone.html
resource "aws_route53_zone" "tld_zone" {
  name          = "${var.toplevel_domain}"
  comment       = "${var.zone_comment}"
  vpc_id        = "${var.vpc_id}"
  tags          = "${var.tags}"
  force_destroy = "${var.force_destroy}"
}

## add A records to the domain
resource "aws_route53_record" "a_record" {
  count   = "${length(var.a_records)}"
  zone_id = "${aws_route53_zone.tld_zone.zone_id}"
  name    = "${element(var.a_records, count.index)}"
  type    = "A"
  ttl     = "${var.ttl}"
  records = ["${element(var.a_record_addresses, count.index)}"]
}

## add CNAME records to the domain
resource "aws_route53_record" "cname_record" {
  count   = "${length(var.cname_records)}"
  zone_id = "${aws_route53_zone.tld_zone.zone_id}"
  name    = "${element(var.cname_records, count.index)}"
  type    = "CNAME"
  ttl     = "${var.ttl}"
  records = ["${element(var.cname_record_addresses, count.index)}"]
}

