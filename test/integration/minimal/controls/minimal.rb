# Copyright 2019 Google LLC
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

project_id = attribute('project_id')
instance_names = attribute('instance_names')
zone = "us-central1-a"

control 'minimal' do
  title 'memcached instance minimal configuration'

  instance_names.each do |instance_name|
    describe google_compute_instance(project: project_id, zone: zone, name: instance_name) do
      its('status') { should eq 'RUNNING' }
    end
  end

end

