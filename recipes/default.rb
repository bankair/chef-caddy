#
# Cookbook Name:: caddy
# Recipe:: default
#
# Copyright 2015, computerlyrik, Christian Fischer
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Conventions
# caddy install dir at /usr/local/caddy
# log at /usr/local/caddy/caddy.log
# pidfile at /var/run/caddy.pid


ark 'caddy' do 
  url 'https://caddyserver.com/download/build?os=linux&arch=amd64&features='
  extension 'tar.gz'
  has_binaries ['./caddy']
  strip_components 0
end

execute 'setcap cap_net_bind_service=+ep caddy' do
  cwd '/usr/local/caddy'
  action :nothing
  subscribes :run, 'ark[caddy]',:immediately
end

template '/etc/Caddyfile' do
  variables ({ 'resource' => { 'host' => 'localhost' , 'port' => 8080 }})
end

caddy_binary = 'caddy'
caddy_options = "-agree -email #{node['caddy']['email']} -pidfile /var/run/caddy.pid -log /usr/local/caddy/caddy.log"

variables = ({
  :command => caddy_binary,
  :options => caddy_options
})

if %w(arch gentoo rhel fedora suse).include? node['platform_family']
  # Systemd
  template '/etc/system.d/caddy' do
    source 'systemd.erb'
    mode '0755'
    variables variables
  end
else
  # SysV
  template '/etc/init.d/caddy' do
    source 'sysv.erb'
    mode '0755'
    variables variables
  end
end





service 'caddy' do
  action [:enable, :start]
end
