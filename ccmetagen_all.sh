#! /usr/bin/env bash

# ccmetagen_all.sh
# Matthew Teasdale
# Cambridge 2023

# set globals
GENOME=$1
FASTQ_FILE=$2
SHORT_NAME=$3
THREADS=$4


# check the arguments we got if bad exit
if [ "$#" -ne 4 ]; then
	echo "Wrong number of arguments!"
	echo "align_all.sh usage.."
	echo "./ccmetagen_all.sh GENOME FASTQ_FILE SHORT_NAME THREADS"
	exit
fi

# print them if correct
echo $@

# bwa aln step
kma \
	-i $FASTQ_FILE \
	-o $SHORT_NAME"_kma_out" \
	-t_db $GENOME \
	-t $THREADS \
	-1t1 \
	-mem_mode \
	-and

# bwa samse step
CCMetagen.py \
	-i $SHORT_NAME"_kma_out.res" \
	-o $SHORT_NAME"_ccmetagen_out"

