#!/bin/bash

tar -xzf R361.tar.gz


# make sure the script will use your R installation, 
# and the working directory as its home locatio

export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

Rscript 1.R $1
