resource "aws_subnet" "dmz" {
#  count = "${var.azcount}"
  vpc_id = "${aws_vpc.vpc.id}"
#  count = "${var.azcount}"
#  count = 3
#  cidr_block = "${cidrsubnet(${aws_vpc.vpc.cidr_block},${data.null_data_source.my.inputs["newbits"]},$count.index+0)}"
#  availability_zone = "${data.aws_availability_zones.available[$count.index]}"
  cidr_block = "${cidrsubnet(${aws_vpc.vpc.cidr_block},${data.null_data_source.my.inputs["newbits"]},0)}"
  availability_zone = "${data.aws_availability_zones.available[0]}"
  tags {
    CostCenter = "${var.costcenter}"
    Name = "${var.nameprefix}-dmz$count.index"
  }
}
