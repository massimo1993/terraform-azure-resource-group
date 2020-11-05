# Azure Resource Group

Terraform module for deploying Azure Resource Group.

![Resource Group](https://tinyurl.com/y2t5b4rq)

A **resource group** is a container that holds related resources for an Azure
solution. The resource group can include all the resources for the solution, or
only those resources that you want to manage as a group. You decide how you want
to allocate resources to resource groups based on what makes the most sense for
your organization. Generally, add resources that share the same lifecycle to the
same resource group so you can easily deploy, update, and delete them as a
group.

![Resource Group Architecture](https://tinyurl.com/y4uzve6y)

# Usage

You can find an example on how to incorporate this module in your project under
[examples](examples).

The examples consist of the following files:

- `backend.tf:` configuration for using remote azurerm backend.
- `environments:` tfvars file for dev, qa and prod environment.
- `main.tf:` the main file with the resource group module.
- `variables.tf:` definition of expected input variables.

# License

This repository is licensed under the **GNU General Public License v3.0** - see
the [LICENSE](LICENSE) file for details.

# Acknowledgments

[Azure Resource Manager](https://tinyurl.com/y4od8qs9)
