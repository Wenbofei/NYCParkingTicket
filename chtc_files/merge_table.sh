#!/bin/bash

tar -xzf R361.tar.gz
tar -xvf temp.tar.gz
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R

Rscript merge_table.R 