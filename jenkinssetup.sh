#!/bin/bash
sudo yum update -y
sudo yum remove java-1.7.0-openjdk -y
sudo yum install java-1.8.0 -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y
sudo service jenkins start


sudo yum install git -y

sudo -su jenkins

sudo curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.12/2020-07-08/bin/linux/amd64/kubectl
sudo chmod +x ./kubectl

sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin

sudo echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

kubectl version --short --client
