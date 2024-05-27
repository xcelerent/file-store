#!/bin/bash

# Update and install necessary packages
sudo apt-get update -y

sudo apt-get install -y curl wget
sudo apt install -y nano
sudo apt install -y unzip

# nifi 1.26 require jdk 11
sudo apt install -y openjdk-11-jdk
update-alternatives --config java
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Download .profile from GitHub and permanently set JAVA_HOME and PATH
wget -O /temp/.profil https://raw.githubusercontent.com/your-repo/your-project/main/.profile
sudo cp /tmp/.profile /home/lingtao/.profile

# Download latest nifi 1.2x zip
wget https://dlcdn.apache.org/nifi/1.26.0/nifi-1.26.0-bin.zip

# Unizip nifi
unzip nifi-1.26.0-bin.zip

# Download nifi.properties from GitHub
wget -O /temp/nifi.properties https://raw.githubusercontent.com/your-repo/your-project/main/nifi.properties

# Overwrite the existing nifi.properties file
sudo cp /tmp/nifi.properties /home/lingtao/nifi-1.26.0/conf/nifi.properties


# Go to installed nifi
cd nifi-1.26.0/

# Reset default auto generated passwords
./bin/nifi.sh set-single-user-credentials admin 1q2w3e4r5t^Y

# Start nifi
./bin/nifi.sh start

# Check nifi status
./bin/nifi.sh status

# Restart nifi
# ./bin/nifi.sh restart

# Stop nifi
# ./bin/nifi.sh stop


