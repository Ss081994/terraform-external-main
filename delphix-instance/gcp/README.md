<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement_google) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider_google) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.delphix](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_firewall.allow_iap_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_dns_record_set.dns_a_record](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |
| [google_dns_record_set.dns_txt_record](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_record_set) | resource |
| [google_dns_managed_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/dns_managed_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_creator"></a> [creator](#input_creator) | Instance creator, used for tagging | `string` | n/a | yes |
| <a name="input_data_disks"></a> [data_disks](#input_data_disks) | Map of data disks to create and attach to the instance | <pre>map(<br>  object({<br>    size = number<br>    type = string<br>    iops = number<br>  })<br>)</pre> | `{}` | no |
| <a name="input_hosted_zone"></a> [hosted_zone](#input_hosted_zone) | Hosted zone name to create a Cloud DNS record in | `string` | `""` | no |
| <a name="input_image_id"></a> [image_id](#input_image_id) | Image ID used for the main instance | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance_name](#input_instance_name) | Name of the new instance | `string` | n/a | yes |
| <a name="input_instance_size"></a> [instance_size](#input_instance_size) | GCP instance machine type | `string` | `"n2-standard-2"` | no |
| <a name="input_owner"></a> [owner](#input_owner) | Instance owner, used for tagging | `string` | n/a | yes |
| <a name="input_project_id"></a> [project_id](#input_project_id) | GCP project ID | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service_account_email](#input_service_account_email) | Service account email for the instance | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input_network) | GCP VPC network name | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input_subnet) | GCP subnet name | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input_zone) | GCP availability zone | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input_tags) | Map of tags to tag all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance_id](#output_instance_id) | ID of the created instance |
| <a name="output_instance_ip"></a> [instance_ip](#output_instance_ip) | Internal IP of the created instance |
| <a name="output_tunnel_command"></a> [tunnel_command](#output_tunnel_command) | gcloud command to SSH tunnel into the instance via IAP |
<!-- END_TF_DOCS -->
