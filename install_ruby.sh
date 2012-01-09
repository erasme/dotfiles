#!/bin/sh

[ -x /usr/bin/apt-get ] && apt-get -y install libssl-dev libreadline-dev

bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

# Install 1.9.3
rvm install ruby-1.9.3
rvm use 1.9.3 --default

# better REPL & print
gem install pry awesome_print interactive_editor

