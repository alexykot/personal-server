#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -r $DIR /root/server_provision

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYMKkvEMcENOkNCF1VsFe+aK3NiViEoJUt0kKgKCoOuUkLOp74jToO5kvGbcBWbvhW1e7gxKSarNdUfQ3SjdJ+FrSF8w4yYu6viNchON+x8VCSJzGR9uf99Y8qM6eemHwGzzCVNoqkx9F4r5+7hdZSz6qJpMKB0RFCg+qoyApxIxewFYGG3idSQ4CqkbO8Dazu1SYBi6dCCJhETXdakF9pMb4IBbXn0aYdIyp6Nxngpg3WLoSVIYjLPrdNTjElex1aIL0p2+O+DGuxzQWXUii5fLRN45+VFZQdHxhuAlWo+fjYUQ4qQqVdD54xtpvDOk9BaJ2ehFeKp9m5/p9BTE27 alexykot@D630" >> ~/.ssh/authorized_keys
/etc/init.d/ssh start

apt-get update
apt-get upgrade
apt-get install -y sudo ca-certificates mc git cpufrequtils sysfsutils apt-transport-https curl ntp
git config --global core.editor "mcedit"
git config --global user.email "alexykot@gmail.com"
git config --global user.name "Alex Kotenko"

apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install -y docker-engine
service docker start

/root/server_provision/init_containers.sh
