#
# Cookbook Name:: metasploit
# Attributes:: metasploit
#
# Copyright (C) 2013 Jonathan Werrett
# 
# All rights reserved - Do Not Redistribute
#

default['metasploit']['install_directory'] = "/opt"
default['metasploit']['metasploit_directory'] = "#{default['metasploit']['install_directory']}/metaploit/"
default['metasploit']['github_url'] = "https://github.com/rapid7/metasploit-framework.git"

