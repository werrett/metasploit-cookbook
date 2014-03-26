# Metasploit Cookbook

Cookbook to download and install the latest version of
[Metasploit](http://www.metasploit.com/) from Github. Based off
[Rapid7's notes](https://github.com/rapid7/metasploit-framework/wiki/Setting-Up-a-Metasploit-Development-Environment).

# Requirements

The following cookbooks are prerequisites:

  * apt
  * ruby_build
  * [rbenv](http://github.com/fnichol/chef-rbenv)

And it will pull in the following `apt` packages (don't blame me, blame Metasploit):

  * autoconf
  * bison
  * curl
  * git-core
  * libapr1
  * libaprutil1
  * libcurl4-openssl-dev
  * libpcap-dev
  * libpq-dev
  * libreadline6-dev
  * libssl-dev
  * libsvn1
  * libtool
  * libxml2
  * libxml2-dev
  * libxslt-dev
  * libyaml-dev
  * locate
  * ncurses-dev
  * openssl
  * postgresql
  * postgresql-contrib
  * wget
  * zlib1g
  * zlib1g-dev

Note: Only tested under Ubuntu 12.04 LTS 64-bit.

# Usage

To spin up an Ubuntu install using [Vagrant](http://vagrantup.com):

```
git clone https://github.com/werrett/metasploit-cookbook.git metasploit-vm
cd metasploit-vm
vagrant up --provision
...
vagrant ssh
msfconsole -v
msfconsole
```

# Attributes

  * directory - Where Metasploit will live.
  * url - Github URL to clone Metasploit from.
  * reference - Branch to clone from.
  * clone_timeout - Cloning time out. Needs to be longish.


# Todo

  * A separate recipe that installs from a tarball. Pulling from Github is slow.

# Author

Jonathan Werrett (<jonathan@werrett.hk>)
