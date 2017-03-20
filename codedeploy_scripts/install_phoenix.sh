#!/bin/bash
### check
echo 'check id/env >>>'
id
pwd
env
echo 'check id/env <<<'

# [stderr]erlexec: HOME must be set
export HOME=/root

### Install Erlang
# https://www.erlang-solutions.com/resources/download.html
# For example: when we started providing R16B02, Ubuntu 12.04 LTS Precise Pangolin still provided R14B02. Our packages are complete, easy to install and have been thoroughly tested.
# wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
# rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
# # instaed of erlang, install esl-erlang, which includes the Erlang/OTP platform and all of its applications
# yum install -y esl-erlang

cat >> /etc/yum.repos.d/erlang-solutions.repo <<EOF
[erlang-solutions]
name=Centos \$releasever - \$basearch - Erlang Solutions
baseurl=https://packages.erlang-solutions.com/rpm/centos/\$releasever/\$basearch
gpgcheck=1
gpgkey=https://packages.erlang-solutions.com/rpm/erlang_solutions.asc
enabled=1
EOF

yum update -y
yum install -y esl-erlang
# エラー: パッケージ: esl-erlang-19.3-1.x86_64 (erlang-solutions)
#              要求: libwx_gtk2u_core-2.8.so.0()(64bit)
# ...
# エラー: パッケージ: esl-erlang-19.3-1.x86_64 (erlang-solutions)
#              要求: libwx_gtk2u_html-2.8.so.0()(64bit)


### http://elixir-lang.org/install.html#compiling-from-source-unix-and-mingw
curl -L -O https://github.com/elixir-lang/elixir/archive/v1.4.2.tar.gz
tar xzvf v1.4.2.tar.gz
cd elixir-1.4.2
make install

# http://www.phoenixframework.org/docs/installation
which mix
mix --version
mix --force local.hex
mix --force local.rebar
mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez

