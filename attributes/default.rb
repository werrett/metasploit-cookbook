#
# Cookbook Name:: metasploit
# Attributes:: metasploit
#
# Copyright (C) 2013 Jonathan Werrett
# 
# All rights reserved - Do Not Redistribute
#

default['metasploit']['directory']               = "/opt/metasploit/"

default['metasploit']['github']['url']           = "https://github.com/rapid7/metasploit-framework.git"
default['metasploit']['github']['reference']     = "master"
default['metasploit']['github']['clone_timeout'] = 1500