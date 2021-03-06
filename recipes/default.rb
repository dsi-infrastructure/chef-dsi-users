#
# Cookbook Name:: dsi-users
# Recipe:: default
#
# Copyright (C) 2015 Stephane LII
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

dsi_users 'sysadmin'

unless node['fqdn'].include? "gitlab"
  dsi_users 'rundeck' do
    passwordless true
  end
end

if node['dsi-users']['dev'] == true
  dsi_users 'vagrant' do
    passwordless true
  end
end

if node['fqdn'].include? "dev"
  dsi_users 'dev' do
    passwordless true
  end
end
