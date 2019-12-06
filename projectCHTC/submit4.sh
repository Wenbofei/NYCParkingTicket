#!/bin/bash
sh rename.sh
sh split4.sh
condor_submit submit.sub

