# terraform-azure-vnet
# Terraform Azure Infrastructure

This Terraform configuration defines an Azure infrastructure using the Azure provider.

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Module Outputs](#module-outputs)
- [Examples](#examples)
- [License](#license)

## Introduction
This repository contains Terraform code to deploy resources on Microsoft Azure, including a resource group and a virtual network.

## Usage
You can use this module in your Terraform configuration like this:

The "vnet" module creates an Azure Virtual Network. It references the resource group created by the "resource_group" module.

# Examples

```hcl
module "vnet" {
  source              = "git::https://github.com/cypik/terraform-azure-vnet.git?ref=v1.0.0"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  address_space       = "10.0.0.0/16"
}
```
Please ensure you specify the correct 'source' path for the module.

## Module Inputs
The following input variables can be configured:

- 'name': The name for the resource group and virtual network.
- 'environment': The environment or purpose of the resources.
- 'location': The Azure region where the resources will be created.
- 'address_space': The address space for the virtual network.

## Module Outputs
This module provides the following outputs:

- 'resource_group_name': The name of the created Azure resource group.
- 'resource_group_location': The location of the created Azure resource group.

# Examples
For detailed examples on how to use this module, please refer to the 'examples' directory within this repository.

# License
This Terraform module is provided under the '[License Name]' License. Please see the [LICENSE](https://github.com/cypik/terraform-azure-vnet/blob/master/LICENSE) file for more details.

# Author
Your Name
Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.
