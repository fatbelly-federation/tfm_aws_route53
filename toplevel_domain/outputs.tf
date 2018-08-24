output "tld_zone_id" {
  value = "${aws_route53_zone.tld_zone.zone_id}"
}

output "tld" {
  value = "${aws_route53_zone.tld_zone.name}"
}

output "name_servers" {
  value = "${aws_route53_zone.tld_zone.*.name_servers}"
}

output "a_records" {
  value = "${aws_route53_record.a_record.*.fqdn}"
}

output "cname_records" {
  value = "${aws_route53_record.cname_record.*.fqdn}"
}
