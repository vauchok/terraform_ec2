#!/bin/bash

yum -y install epel-release
yum -y install git, python-pip unzip wget
pip install awscli

mkdir -p /opt/jenkins/jenkins-slave
chown -R centos:centos /opt/jenkins/jenkins-slave

# terraform installation
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
unzip terraform_0.11.7_linux_amd64.zip -d /usr/bin/ && rm -rf terraform_0.11.7_linux_amd64.zip