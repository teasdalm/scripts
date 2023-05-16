#! /usr/bin/env bash

# bowtie2_host.sh
# Matthew Teasdale
# Cambridge 2023

# set globals
GENOME=$1
FASTQ_FILE=$2
SHORT_NAME=${FASTQ_FILE%.*.*}
THREADS=$3


# check the arguments we got if bad exit
if [ "$#" -ne 3 ]; then
	echo "Wrong number of arguments!"
	echo "align_all.sh usage.."
	echo "./bowtie2_host.sh GENOME FASTQ_FILE THREADS"
	exit
fi

# print them if correct
echo "bowtie2 sensitive alignment for "$@

# bowite host removed aln step
bowtie2 \
	--very-sensitive \
	-x $GENOME \
	-p $THREADS \
	-U $FASTQ_FILE \
	--un-gz $SHORT_NAME"_host_removed_sensitive.fastq.gz" \
	-S $SHORT_NAME"_host_reads_sensitive.sam" \
	2> $SHORT_NAME"_host_removed_sensitive.log"

# Remove possible PCR duplicates from filtered file
echo "seqkit rmdup for "$SHORT_NAME"_host_removed_sensitive.fastq.gz"

zcat $SHORT_NAME"_host_removed_sensitive.fastq.gz" \
	| seqkit rmdup -j $THREADS -s \
	2> $SHORT_NAME"_host_removed_sensitive_rmdup.log" \
	| gzip >  $SHORT_NAME"_host_removed_sensitive_rmdup.fastq.gz"

