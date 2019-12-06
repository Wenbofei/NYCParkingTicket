#!/bin/bash
sh rename.sh
sh split2.sh
condor_submit submit.sub

