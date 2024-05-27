#!/bin/bash

# ---------------------------------------------------------
# Update and install necessary packages
# ---------------------------------------------------------
sudo apt-get update -y

sudo apt-get install -y curl wget
sudo apt-get install -y nano
sudo apt-get install -y unzip

# nifi 1.26 require jdk 11
sudo apt-get install -y openjdk-11-jdk
update-alternatives --config java
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH


# ---------------------------------------------------------
# NiFi Installation
# ---------------------------------------------------------
cd /home/lingtao

# Download latest nifi 1.2x zip
wget https://dlcdn.apache.org/nifi/1.26.0/nifi-1.26.0-bin.zip

# Unizip nifi
unzip nifi-1.26.0-bin.zip


mkdir downloads
cd downloads

# Download .profile from GitHub and permanently set JAVA_HOME and PATH
wget https://raw.githubusercontent.com/xcelerent/file-store/main/tf-az-kw-nifi/.profile
sudo cp .profile /home/lingtao/.profile

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH


# Download nifi.properties from GitHub
wget https://raw.githubusercontent.com/xcelerent/file-store/main/tf-az-kw-nifi/dev/nifi.properties

# Overwrite the existing nifi.properties file
sudo cp nifi.properties /home/lingtao/nifi-1.26.0/conf/nifi.properties



# Go to installed nifi
cd ..
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


