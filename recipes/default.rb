#
# Cookbook Name:: metasploit
# Recipe:: default
#
# Copyright (C) 2013 Jonathan Werrett
# 
# All rights reserved - Do Not Redistribute
#

package 'build-essential'
package 'zlib1g'
package 'zlib1g-dev'
package 'libxml2'
package 'libxml2-dev'
package 'libxslt-dev'
package 'locate'
package 'libreadline6-dev'
package 'libcurl4-openssl-dev'
package 'git-core'
package 'libssl-dev'
package 'libyaml-dev'
package 'openssl'
package 'autoconf'
package 'libtool'
package 'ncurses-dev'
package 'bison'
package 'curl'
package 'wget'
package 'postgresql'
package 'postgresql-contrib'
package 'libpq-dev'
package 'libapr1'
package 'libaprutil1'
package 'libsvn1'
package 'libpcap-dev'

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

bash "install_metasploit" do
  cwd  metasploit_directory
  user "root"

  code <<-EOH
    # Install pg before the bundle. Fixes a bug where pg_config was not found.
    RBENV_ROOT="#{rbenv_root}" && \
    RBENV_VERSION=`cat #{rbenv_root}/version` && \
    $RBENV_ROOT/shims/gem install pg -q -v '0.16.0' --no-rdoc --no-ri -- --with-pg-config=/usr/bin/pg_config

    bundle install
  EOH
  action :nothing

  not_if "#{metasploit_directory}msfconsole --version | grep -q 'Framework Version'"
end





