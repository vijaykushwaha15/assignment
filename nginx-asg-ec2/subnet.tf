data "aws_vpc" "default_vpc" {
  default = true
}

data "aws_subnet_ids" "default_subnet_ids" {
  vpc_id = data.aws_vpc.default_vpc.id
}

data "aws_subnet" "default_subnet" {
  for_each = data.aws_subnet_ids.default_subnet_ids.ids
  id       = each.value
}

output "subnet_cidr_blocks" {
  value = [for s in data.aws_subnet.default_subnet : s.id]
}
