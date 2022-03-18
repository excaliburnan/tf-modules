provider "ibm" {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = "~> 1.12.0"
    }
}

provider {
  region = var.service_region
  ibmcloud_api_key = var.ibmcloud_api_key
}

// Provision cloudant resource instance with Lite plan
resource "ibm_cloudant" "cloudant" {
  // Required arguments:
  name     = "test_lite_plan_cloudant"
  location = var.service_region
  plan     = "lite"
}

// Create cloudant data source
data "ibm_cloudant" "cloudant" {
  name     = ibm_cloudant.cloudant.name
}
