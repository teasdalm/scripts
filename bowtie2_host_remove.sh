#! /usr/bin/env bash

# bowtie2_host_remove.sh
# Matthew Teasdale
# Newcastle BSU 2023

# Versions 
# Tested with Bowtie 2 version 2.5.1

# set globals
GENOME=$1
FASTQ_FILE=$2
THREADS=$3

base=`echo $FASTQ_FILE | cut -f 1-3 -d "_"`

bowtie2 \
	-x $GENOME \
	-p $THREADS \
	-1 $base"_R1_001_trimmed.fastq.gz"  \
	-2 $base"_R2_001_trimmed.fastq.gz" \
	--un-conc-gz $base"_nonhuman_reads.fastq.gz" \
	-S $base"_human_reads.sam" \
	2> $base"_nonhuman_reads_bowtie2.log"


