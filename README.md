# terraform-aws-impostor-server
An terraform module to create an [Impostor server](https://github.com/Impostor/Impostor)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.impostor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_lb.game](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb.match](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http_443](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.http_80](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.udp_22022](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.udp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_lb_target_group_attachment.udp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_route53_record.gameserver](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.matchmaker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.amongus_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.amongus_instance_http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.amongus_instance_udp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ami.al2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gameserver_subnets"></a> [gameserver\_subnets](#input\_gameserver\_subnets) | List of subnet objects for the gameserver nlb | <pre>list(object({<br>    id                = string<br>    arn               = string<br>    vpc_id            = string<br>    availability_zone = string<br>  }))</pre> | n/a | yes |
| <a name="input_instance_subnet"></a> [instance\_subnet](#input\_instance\_subnet) | Subnet object for the gameserver instance | <pre>object({<br>    id                = string<br>    arn               = string<br>    vpc_id            = string<br>    availability_zone = string<br>  })</pre> | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The size of the server | `string` | `"t3a.micro"` | no |
| <a name="input_matchmaker_subnets"></a> [matchmaker\_subnets](#input\_matchmaker\_subnets) | List of subnet objects for the match maker alb | <pre>list(object({<br>    id                = string<br>    arn               = string<br>    vpc_id            = string<br>    availability_zone = string<br>  }))</pre> | n/a | yes |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | The location of the private key file used to connect to the instance | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | The Route53 zone | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
