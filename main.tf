data "aws_ec2_transit_gateway_route_tables" "ec2_transit_gateway_route_tables_lookup" {
  for_each = var.ec2_transit_gateway_route_tables_lookup

  region = each.value.region
  tags   = each.value.tags

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}

