#! /usr/bin/env bash

# align_all.sh
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
	echo "./align_all.sh GENOME FASTQ_FILE SHORT_NAME THREADS"
	exit
fi

# print them if correct
echo $@

# bwa aln step
bwa aln \
-t $THREADS \
-l 1024 \
-n 0.01 \
-o 2 \
$GENOME \
$FASTQ_FILE > $SHORT_NAME".sai"

# bwa samse step
bwa samse $GENOME $SHORT_NAME".sai" $FASTQ_FILE \
	| samtools view -Sb - > $SHORT_NAME".bam"

# clean up
rm $SHORT_NAME".sai"
