#! /usr/bin/env bash
# Adaptor removal all
# Matthew Teasdale 2023

# Fastq files
FASTQ_FILE=${1%_R?_001.*.*}
FASTQ_1=$FASTQ_FILE"_R1_001.fastq.gz"
FASTQ_2=$FASTQ_FILE"_R2_001.fastq.gz"


# AdapterRemoval command
AdapterRemoval \
	--gzip \
	--file1 $FASTQ_1  \
	--file2 $FASTQ_2  \
	--threads 40 \
	--mm 3 \
	--minlength 30 \
	--basename $FASTQ_FILE \
	--trimns \
	--trimqualities \
	--collapse  \
	--output1 $FASTQ_FILE"_trimmed_R1.fastq.gz" \
	--output2 $FASTQ_FILE"_trimmed_R2.fastq.gz" \
	--outputcollapsedtruncated $FASTQ_FILE"_truncated.fastq.gz" \
	--outputcollapsed $FASTQ_FILE"_collapsed_R1R2.fastq.gz" \
	--discarded $FASTQ_FILE"_discarded.fastq.gz" \
	--settings $FASTQ_FILE".settings" \
	--singleton $FASTQ_FILE"_singleton.fastq.gz" \
	--adapter1 AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC \
	--adapter2 AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTAGATCTCGGTGGTCGCCGTATCATT
