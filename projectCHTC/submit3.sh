#!/bin/bash
sh rename.sh
sh split3.sh
condor_submit submit.sub

