#
# Cookbook Name:: metasploit
# Attributes:: metasploit
#
# Copyright (C) 2014 Jonathan Werrett
#

default['metasploit']['directory'] = "/opt/metasploit"

default['metasploit']['github']['url']           = "https://github.com/rapid7/metasploit-framework.git"
default['metasploit']['github']['reference']     = "master"
default['metasploit']['github']['clone_timeout'] = 1500
