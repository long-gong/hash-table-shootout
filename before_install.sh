#!/usr/bin/env bash

set -e 

sudo apt-get install \
    g++ \
    cmake \
    libboost-all-dev \
    libevent-dev \
    libdouble-conversion-dev \
    libgoogle-glog-dev \
    libgflags-dev \
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
    libunwind-dev

cd /tmp
wget https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.tar.gz
tar -zxvf boost_1_71_0.tar.gz
cd boost_1_71_0
./bootstrap.sh && ./b2 install
cd /tmp 
rm -rf boost_1_71_0*

git clone https://github.com/fmtlib/fmt.git && cd fmt

mkdir _build && cd _build
cmake .. -DFMT_TEST=Off

make -j$(nproc)
sudo make install


wget https://github.com/facebook/folly/archive/v2020.06.15.00.tar.gz
tar -zxvf v2020.06.15.00.tar.gz
cd folly-2020.06.15.00/_build 
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

git submodule update --init --recursive

