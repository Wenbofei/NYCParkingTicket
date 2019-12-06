#!/bin/bash
sh rename.sh
sh split.sh
condor_submit submit.sub

