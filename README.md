# Terraform-azure-vnet

# Terraform Azure Cloud Vnet Module

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#examples)
- [Authors](#authors)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This repository contains Terraform code to deploy resources on Microsoft Azure, including a resource group and a virtual network.

## Usage
You can use this module in your Terraform configuration like this:

The "vnet" module creates an Azure Virtual Network. It references the resource group created by the "vnet" module.

# Examples

# Example: complete_vnet

```hcl
module "vnet" {
  source                 = "cypik/vnet/azure"
  version                = "1.0.2"
  name                   = "app"
  environment            = "test"
  resource_group_name    = module.resource_group.resource_group_name
  location               = module.resource_group.resource_group_location
  address_space          = "10.0.0.0/16"
  enable_ddos_pp         = false
  enable_network_watcher = false
}
```

# Example: vnet_with_existing_ddos_id

```hcl
module "vnet" {
  source                 = "cypik/vnet/azure"
  version                = "1.0.2"
  name                   = "app-vnet"
  environment            = "test"
  resource_group_name    = module.resource_group.resource_group_name
  location               = module.resource_group.resource_group_location
  address_spaces         = ["10.0.0.0/16"]
  existing_ddos_pp       = "/subscriptions/subscriptions_id/resourceGroups/app-test-resource-group/providers/Microsoft.Network/ddosProtectionPlans/app-vnet-test-ddospp"
  enable_network_watcher = false
}
```

Please ensure you specify the correct 'source' path for the module.

# Examples
For detailed examples on how to use this module, please refer to the [examples](https://github.com/cypik/terraform-azure-vnet/blob/master/_examples) directory within this repository.

# License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/cypik/terraform-azure-vnet/blob/master/LICENSE) file for more details.

# Author
Your Name
Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 4.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 4.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | cypik/labels/azure | 1.0.2 |

## Resources

| Name | Type |
|------|------|
| [azurerm_network_ddos_protection_plan.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan) | resource |
| [azurerm_network_watcher.flow_log_nw](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used by the virtual network. | `string` | `""` | no |
| <a name="input_address_spaces"></a> [address\_spaces](#input\_address\_spaces) | The list of the address spaces that is used by the virtual network. | `list(string)` | `[]` | no |
| <a name="input_bgp_community"></a> [bgp\_community](#input\_bgp\_community) | The BGP community attribute in format <as-number>:<community-value>. | `number` | `null` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | The DNS servers to be used with vNet. | `list(string)` | `[]` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | (Optional) Specifies the Edge Zone within the Azure Region where this Virtual Network should exist. Changing this forces a new Virtual Network to be created. | `string` | `null` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Flag to control the module creation | `bool` | `true` | no |
| <a name="input_enable_ddos_pp"></a> [enable\_ddos\_pp](#input\_enable\_ddos\_pp) | Flag to control the resource creation | `bool` | `false` | no |
| <a name="input_enable_network_watcher"></a> [enable\_network\_watcher](#input\_enable\_network\_watcher) | Flag to control creation of network watcher. | `bool` | `false` | no |
| <a name="input_enforcement"></a> [enforcement](#input\_enforcement) | Specifies if the encrypted Virtual Network allows VM that does not support encryption. Possible values are DropUnencrypted and AllowUnencrypted. | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_existing_ddos_pp"></a> [existing\_ddos\_pp](#input\_existing\_ddos\_pp) | ID of an existing DDOPS plan defined in the same subscription | `string` | `null` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(string)` | `{}` | no |
| <a name="input_flow_timeout_in_minutes"></a> [flow\_timeout\_in\_minutes](#input\_flow\_timeout\_in\_minutes) | The flow timeout in minutes for the Virtual Network, which is used to enable connection tracking for intra-VM flows. Possible values are between 4 and 30 minutes. | `number` | `10` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the virtual network is created. Changing this forces a new resource to be created. | `string` | `""` | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'info@cypik.com' | `string` | `"info@cypik.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/cypik/terraform-azure-vnet"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ddos_protection_plan_id"></a> [ddos\_protection\_plan\_id](#output\_ddos\_protection\_plan\_id) | The ID of the DDoS Protection Plan |
| <a name="output_id"></a> [id](#output\_id) | The id of the newly created vNet |
| <a name="output_name"></a> [name](#output\_name) | The name of the newly created vNet |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | The ID of the Network Watcher. |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | The name of Network Watcher deployed. |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | The address space of the newly created vNet |
| <a name="output_vnet_guid"></a> [vnet\_guid](#output\_vnet\_guid) | The GUID of the virtual network. |
| <a name="output_vnet_location"></a> [vnet\_location](#output\_vnet\_location) | The location of the newly created vNet |
| <a name="output_vnet_rg_name"></a> [vnet\_rg\_name](#output\_vnet\_rg\_name) | The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created |
<!-- END_TF_DOCS -->