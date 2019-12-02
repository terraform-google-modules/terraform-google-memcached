# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#project_id            = attribute('project_id')
#service_account_email = attribute('service_account_email')
#credentials_path      = attribute('credentials_path')
#
#ENV['CLOUDSDK_AUTH_CREDENTIAL_FILE_OVERRIDE'] = File.absolute_path(
#  credentials_path,
 # File.join(__dir__, "../../../fixtures/minimal"))

control 'memcached-instance-minimal' do
  title 'memcached instance minimal configuration'

  describe command("gcloud compute instances describe gusw1-dev-memcached-0001-001 --zone us-west1-a") do
    its('stdout') {should match (/status: RUNNING/)}
  end
  describe command("gcloud compute instances describe gusw1-dev-memcached-0001-002 --zone us-west1-a") do
    its('stdout') {should match (/status: RUNNING/)}
  end
end

