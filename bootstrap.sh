#!/bin/bash
sudo yum install -y epel-release
sudo yum install -y sshpass net-tools psmisc htop tmux git
# install docker to all nodes
CHECKDOCKER=`rpm -qa|grep docker-common`
CHECKNEWDOCKER=`rpm -qa|grep docker-engine`
if [ ! -z "$CHECKDOCKER" ]
then
  service docker stop
  yum remove -y docker-common docker-selinux docker
  rm -rf /var/lib/docker
fi

if [ -z "$CHECKNEWDOCKER" ]
then
sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

yum install -y docker-engine
systemctl start docker
systemctl enable docker
fi

git clone https://github.com/kubernetes/kube-deploy /tmp/kube-deploy
