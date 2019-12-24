/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

provider "google" {
  version = "~> 2.10.0"
  region  = var.region
  project = var.project_id
}

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 1.5.0"

  project_id              = var.project_id
  network_name            = "test-network"
  auto_create_subnetworks = false
  subnets = [
    {
      subnet_name   = "test-subnet"
      subnet_ip     = "10.0.0.0/28"
      subnet_region = var.region
    }
  ]
}

module "memcached-instances" {
  source          = "../../"
  project_id      = var.project_id
  region          = var.region
  memcached_ips   = ["10.0.0.10", "10.0.0.11"]
  subnetwork      = module.vpc.subnets_self_links[0]
  service_account = var.service_account
}
