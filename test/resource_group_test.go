package test

import (
  "os"
  "testing"

  "github.com/gruntwork-io/terratest/modules/azure"
  "github.com/gruntwork-io/terratest/modules/terraform"

  "github.com/stretchr/testify/assert"
)

func TestResourceGroup(t *testing.T) {
  terraformOptions := &terraform.Options{
    TerraformDir: "../examples/resource-group",
    VarFiles: []string{
      "environments/dev.tfvars",
    },
  }

  defer terraform.Destroy(t, terraformOptions)
  terraform.InitAndApply(t, terraformOptions)

  validateName(t, terraformOptions)
  validateRegion(t, terraformOptions)
  validateTags(t, terraformOptions)
}

func validateName(t *testing.T, terraformOptions *terraform.Options) {
  t.Run("ResourceGroupName", func(t *testing.T) {
    name := terraform.Output(t, terraformOptions, "name")
    expectedName := "rg-codename47-dev-001"

    assert.Equal(t, expectedName, name)
  })
}

func validateRegion(t *testing.T, terraformOptions *terraform.Options) {
  t.Run("ResourceGroupRegion", func(t *testing.T) {
    region := terraform.Output(t, terraformOptions, "region")
    expectedRegion := "southcentralus"

    assert.Equal(t, expectedRegion, region)
  })
}

func validateTags(t *testing.T, terraformOptions *terraform.Options) {
  t.Run("ResourceGroupTags", func(t *testing.T) {
    expectedName := "rg-codename47-dev-001"
    subscriptionID := os.Getenv("ARM_SUBSCRIPTION_ID")

    resourceGroup, _ := azure.GetAResourceGroupE(expectedName, subscriptionID)
    tags := resourceGroup.Tags

    expectedTags := map[string]string{
      "project": "codename47",
      "environment": "dev",
      "source": "terraform",
      "owner": "diana",
    }

    for key, tag := range tags {
      assert.Equal(t, expectedTags[key], *tag)
    }
  })
}
