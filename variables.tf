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

variable "project_id" {
  type        = string
  description = "The project to deploy to, if not set the default provider project is used."
  default     = ""
}

variable "region" {
  type        = string
  description = "Region to launch instances"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "The zone that the machine should be created in"
  default     = "us-central1-a"
}

variable "subnetwork" {
  type        = string
  description = "The name or self_link of the subnetwork to attach the network interface to"
}

variable "env" {
  type        = string
  description = "Environment"
  default     = ""
}

variable "machine_type" {
  type        = string
  description = "Memcached instance machine type"
  default     = "n1-standard-2"
}

variable "memcached_ips" {
  description = "A list of static IP addresses for memcached."
  type        = list(string)
}

variable "boot_disk_size" {
  type        = string
  description = "Boot disk size in GB"
  default     = "100"
}

variable "boot_disk_type" {
  type        = string
  description = "Boot disk type"
  default     = "pd-ssd"
}

variable "boot_disk_image" {
  type        = string
  description = "Boot disk image"
  default     = "debian-cloud/debian-9"
}

variable "service_account" {
  description = "The service account e-mail address. If not given, the default Google Compute Engine service account is used"
  type        = string
}

variable "app_tags" {
  type        = list(string)
  description = "Application tags"
  default     = ["all", "health-check"]
}

variable "allow_stopping_for_update" {
  description = "Allow stopping the instance for specific Terraform changes (e.g. service account update)."
  type        = bool
  default     = true
}
