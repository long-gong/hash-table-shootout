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
$ python3 bench.py
$ python3 make_chart_data.py < output | python3 make_html.py
```

Your charts are now in `charts.html`.

You can tweak some of the values in bench.py to make it run faster at the
expense of less granular data, and you might need to tweak some of the tickSize
settings in charts-template.html.

To run the benchmark at the highest priority possible, do this:

    $ sudo nice -n-20 ionice -c1 -n0 sudo -u $USER python bench.py

You might also want to disable any swap files/partitions so that swapping
doesn't influence performance.  (The programs will just die if they try to
allocate too much memory.)


Copyright Information
=====================

Written by Nick Welch in 2010.
Forked by Tessil in 2016.
Forked by Long in 2020.
No copyright.  This work is dedicated to the public domain.
For full details, see http://creativecommons.org/publicdomain/zero/1.0/
