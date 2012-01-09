#!/bin/sh

echo
echo "This script will attempt to installed required dependencies."
echo "It just works for Ubuntu & CentOS"
echo "Please see 'rvm requirements' it you have a different platform"
echo
echo -n "Press return to continue, or Ctrl-C to exit..."

read 

[ -x /usr/bin/apt-get ] && \
  apt-get -y install build-essential openssl libreadline6 libreadline6-dev \
  curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 \
  libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev \
  ncurses-dev automake libtool bison subversion

[ -x /usr/bin/yum ] && \
  yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel \
  libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake \
  libtool bison iconv-devel

bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

# Install 1.9.3
rvm install ruby-1.9.3
rvm use 1.9.3 --default

# better REPL & print
gem install pry awesome_print interactive_editor

