#!/bin/sh

######################################
#                                    #
#     Install dependent software     #
#                                    #
######################################

sudo yum update -y
sudo yum install python python-pip git wget -y
sudo yum install autoconf automake -y
sudo yum groupinstall 'Development Tools' -y
sudo yum install gcc-c++ libdb4-cxx libdb4-cxx-devel openssl-devel java-1.8.0-openjdk-devel -y
sudo yum install libtool pkgconfig openssl-devel libevent-devel -y
sudo yum install boost boost-devel boost-doc -y

############################
#                          #
#     Install libevent     #
#                          #
############################

wget https://github.com/downloads/libevent/libevent/libevent-1.4.14b-stable.tar.gz #download the source code of libevent by wget method
tar xzf libevent-1.4.14b-stable.tar.gz #unzip
cd libevent-1.4.14b-stable
sudo sh ./configure --prefix=/opt/libevent #generate compiling script
sudo make && sudo make install #install
cd ../
sudo rm -rf libevent-1.4.14b-stable libevent-1.4.14b-stable.tar.gz #delete source code folder
sudo yum install qt5-qtbase qt5-qtbase-x11 qt5-qtx11extras protobuf-devel -y

#######################################################
#                                                     #
#     Download source code of bitcoin from github     #
#                                                     #
#######################################################



#######################################################
#                                                     #
#     Download source code of bitcoin from github     #
#                                                     #
#######################################################

cd bitcoin/ #enter the root of the source code
sudo sh ./autogen.sh #generate configure script
sudo sh ./configure --disable-gui-tests --without-gui #generate compiling script
sudo make -j$(cat /proc/cpuinfo | grep processor | wc -l) && sudo make install #cat /proc/cpuinfo | grep processor | wc -l 輸出本機的cpu數量
echo 'Bitcoin Node Successfully Installed'