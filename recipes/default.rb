#
# Cookbook Name:: metasploit
# Recipe:: default
#
# Copyright (C) 2014 Jonathan Werrett
#

package 'autoconf'
package 'bison'
package 'curl'
package 'git-core'
package 'libapr1'
package 'libaprutil1'
package 'libcurl4-openssl-dev'
package 'libpcap-dev'
package 'libpq-dev'
package 'libreadline6-dev'
package 'libssl-dev'
package 'libsvn1'
package 'libtool'
package 'libxml2-dev'
package 'libxml2'
package 'libxslt-dev'
package 'libyaml-dev'
package 'locate'
package 'ncurses-dev'
package 'openssl'
package 'postgresql-contrib'
package 'postgresql'
package 'wget'
package 'zlib1g-dev'
package 'zlib1g'

metasploit_directory = node['metasploit']['directory'] || "/opt/metasploit"
github_url = node['metasploit']['github']['url']

git "#{metasploit_directory}" do
   repository github_url
   reference  node['metasploit']['github']['reference'] || "master"
   timeout    node['metasploit']['github']['clone_timeout']
   action     :sync
   notifies   :run, "bash[install_metasploit]"
end

rbenv_root = node['rbenv']['root_path']

template "/etc/profile.d/metasploit.sh" do
  source 'metasploit.sh.erb'
  owner 'root'
  group 'root'
  mode  '0755'
end

bash "install_metasploit" do
  cwd  metasploit_directory
  user "root"

  code <<-EOH
    # Install pg before the bundle. Fixes a bug where pg_config was not found.
    RBENV_ROOT="#{rbenv_root}" && \
    RBENV_VERSION=`cat #{rbenv_root}/version` && \
    $RBENV_ROOT/shims/gem install pg -q --no-rdoc --no-ri -- --with-pg-config=/usr/bin/pg_config

    $RBENV_ROOT/shims/bundle install
  EOH
  action :nothing

  not_if "#{metasploit_directory}msfconsole --version | grep -q 'Framework Version'"
end
