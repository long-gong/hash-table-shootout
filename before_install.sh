#!/usr/bin/env bash

set -e 


git submodule update --init --recursive

sudo add-apt-repository universe
sudo apt-get update

# libgoogle-glog-dev \
# libgflags-dev \
sudo apt-get install -y \
    g++ \
    cmake \
    libboost-all-dev \
    libevent-dev \
    libdouble-conversion-dev \
    libiberty-dev \
    liblz4-dev \
    liblzma-dev \
    libsnappy-dev \
    make \
    zlib1g-dev \
    binutils-dev \
    libjemalloc-dev \
    libssl-dev \
    pkg-config \
    libunwind-dev \
    pkg-config \
    qt5-default 

cd /tmp 
wget https://github.com/gflags/gflags/archive/v2.2.2.tar.gz
tar -zxvf v2.2.2.tar.gz
cd gflags-2.2.2
mkdir build && cd build 
cmake ..
make -j$(nproc) && sudo make install 
cd /tmp 
rm -rf v2.2.2.tar.gz gflags-2.2.2

wget https://github.com/google/glog/archive/v0.4.0.tar.gz
tar -zxvf v0.4.0.tar.gz
cd glog-0.4.0
./autogen.sh && ./configure && make && sudo make install
cd /tmp 
rm -rf v0.4.0.tar.gz glog-0.4.0

cd /tmp
rm -rf fmt
git clone https://github.com/fmtlib/fmt.git && cd fmt
mkdir _build && cd _build
cmake .. -DFMT_TEST=Off
make -j$(nproc)
sudo make install

cd /tmp
wget https://github.com/facebook/folly/archive/v2020.06.15.00.tar.gz
tar -zxvf v2020.06.15.00.tar.gz
cd folly-2020.06.15.00/build 
cmake ..
make -j$(nproc)
sudo make install

cd /tmp 
rm -rf v2020.06.15.00.tar.gz folly-2020.06.15.00

rm -rf 
git clone  https://github.com/sparsehash/sparsehash.git
cd sparsehash
./autogen.sh 
./configure 
make -j$(nproc) 
sudo make install 
cd /tmp 
rm -rf sparsehash



