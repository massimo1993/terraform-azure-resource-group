# Resource Group Example

Example demonstrating the deployment of an Azure Resource Group.
The deployment will use the **azurerm backend** to store the state
of the deployment.

### azurerm

Stores the state as a blob with the given key within the blob
container within the blob storage account. This backend also
supports state locking and consistency checking via native
capabilities of Azure Blob Storage.

Refer to [azurerm](https://tinyurl.com/fk75jj7b) for more
information on configuring the azurerm backend.

### Variable Definitions (.tfvars) Files

When deploying resources using Terraform, you have the option
of using **tfvars** files. In this example there is a folder
named **environments** with a set of tfvars files per environment.

To set lots of variables, it is more convenient to specify their
values in a variable definitions file (with a filename ending in
either .tfvars or .tfvars.json) and then specify that file on
the command line with -var-file.

# Usage

```bash
$ terraform init
$ terraform apply -var-file environments/dev.tfvars
```
