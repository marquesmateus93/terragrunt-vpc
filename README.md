# Terragrunt VPC

## About
The project contains a module that creates an AWS VPC structure to provide communication between three subnets layers: one public and two privates.

### - Public Subnets
Allows communication from the internet providing access to private subnets. Bastion hosts could do the communication.

### - Private Subnets
It is divided into two types: application and database.

#### Application Subnets

The application machines don't have external access and should be access by SSH, just from public subnets. This access should be done just from Load Balancer in a specific port.

#### Database Subnets

The database subnet was thought to be associated with an RDS instance and be accessed just from private subnets in a specific port.

## Structure
<img src="https://github.com/user-attachments/assets/17117f34-0199-497b-bbcc-a6f5501b0ba4" width="600" height="700"/>

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.marques_elastic_ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.marques_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.marques_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.marques_private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.marques_public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.marques_data_resource_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.marques_private_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.marques_public_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.marques_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | Default AZs range. Ohio. | `list(string)` | <pre>[<br>  "us-east-2a",<br>  "us-east-2b",<br>  "us-east-2c"<br>]</pre> | no |
| <a name="input_data_resource_cidr_block"></a> [data\_resource\_cidr\_block](#input\_data\_resource\_cidr\_block) | Data resources subnet IPs range. | `list(string)` | <pre>[<br>  "10.0.21.0/24",<br>  "10.0.22.0/24",<br>  "10.0.33.0/24"<br>]</pre> | no |
| <a name="input_prefix_name"></a> [prefix\_name](#input\_prefix\_name) | Resources prefix name. | `string` | n/a | yes |
| <a name="input_private_cidr_block"></a> [private\_cidr\_block](#input\_private\_cidr\_block) | Private subnet IPs range. | `list(string)` | <pre>[<br>  "10.0.11.0/24",<br>  "10.0.12.0/24",<br>  "10.0.13.0/24"<br>]</pre> | no |
| <a name="input_public_cidr_block"></a> [public\_cidr\_block](#input\_public\_cidr\_block) | Public subnet IPs range. | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tracking tags. | `map(string)` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | VPC IPs range. | `string` | `"10.0.0.0/16"` | no |

## Outputs

No outputs.
