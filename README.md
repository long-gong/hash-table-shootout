# HashTable Shootout

[![Build Status](https://travis-ci.org/long-gong/hash-table-shootout.svg?branch=master)](https://travis-ci.org/long-gong/hash-table-shootout)

[hash-table-shootout](https://github.com/long-gong/hash-table-shootout) is a benchmark of some prominent C/C++ hash table implementations.

## Build and Run

```bash
git clone https://github.com/long-gong/hash-table-shootout.git
cd hash-table-shootout
chmod +x ./before_install.sh
./before_install.sh
make -j$(nproc)
make html
```

Your charts are now in `charts.html`. Note that running this benchmark takes long time (as long as a few hours or even more).

Here are some [sample results](https://long-gong.github.io/hash-table-shootout/).

You can also build and run `hash-table-shootout` using [docker](https://www.docker.com/) ([How to install docker on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)) as follows.

```bash
git clone https://github.com/long-gong/hash-table-shootout.git
cd hash-table-shootout
docker build -t yourusername/hash-table-shootout .
docker run -p 8080:80 yourusername/hash-table-shootout
```

## Copyright Information

Written by Nick Welch in 2010.  
Forked by Tessil in 2016.  
Forked by Long in 2020.  
No copyright.  This work is dedicated to the public domain.  
For full details, see http://creativecommons.org/publicdomain/zero/1.0/
