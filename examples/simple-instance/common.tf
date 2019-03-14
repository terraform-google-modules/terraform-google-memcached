/**
 * Copyright 2018 Google LLC
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

terraform {
  required_version = "~> 0.11.8"
}

provider "google" {
  project = "${var.project_name}"
  region  = "${var.region}"
}

provider "random" {}

resource "random_string" "suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "google_service_account" "memcached" {
  account_id   = "${local.service_account_name}"
  display_name = "${local.service_account_name}"
}

resource "google_compute_network" "memcached" {
  name                    = "${local.resource_name}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "memcached" {
  name          = "${local.resource_name}"
  ip_cidr_range = "10.2.0.0/24"
  region        = "${var.region}"
  network       = "${google_compute_network.memcached.self_link}"
}

locals {
  resource_name        = "${var.resource_name}-${random_string.suffix.result}"
  memcached_ips        = "${list("10.2.0.50", "10.2.0.51")}"
  service_account_name = "${var.environment}-${var.region}-memcached-${random_string.suffix.result}"
}
