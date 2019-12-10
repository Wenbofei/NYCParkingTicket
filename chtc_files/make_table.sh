#!/bin/bash

# untar your R installation
tar -xzf R361.tar.gz

# make sure the script will use your R installation, 
# and the working directory as its home location
export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R

# run your script

Rscript make_table.R $1  # note: the 2 actual command-line arguments
                            # go in myscript.sub's "arguments = " line
