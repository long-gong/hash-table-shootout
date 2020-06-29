# HashTable Shootout

[![Build Status](https://travis-ci.org/long-gong/hash-table-shootout.svg?branch=master)](https://travis-ci.org/long-gong/hash-table-shootout)

[hash-table-shootout](https://github.com/long-gong/hash-table-shootout) is a benchmark of some prominent C/C++ hash table implementations.

## Build

```bash
chmod +x ./before_install.sh
./before_install.sh
make -j$(nproc)
```

## Run

```bash
make html
```

Your charts are now in `charts.html`. Note that running this benchmark takes long time (as long as a few hours or even more).


## Copyright Information


Written by Nick Welch in 2010.  
Forked by Tessil in 2016.  
Forked by Long in 2020.  
No copyright.  This work is dedicated to the public domain.  
For full details, see http://creativecommons.org/publicdomain/zero/1.0/
