#! /usr/bin/env bash 
# Matthew Teasdale
# Cambridge 2020

# set globals
BAM_FILE=$1
Q_VALUE=$2

BASE=${BAM_FILE%."bam"}

# filt and let user know
echo "Filtering $BAM_FILE with settings.. F4 q$Q_VALUE" 
samtools view -b -F 4 -q $Q_VALUE $BAM_FILE > $BASE"_F4_q"$Q_VALUE".bam"


