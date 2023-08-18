#! /usr/bin/env bash
# cutadapt_pe_next.sh
# Matthew Teasdale
# Newcastle BSU 2023
# Tested with cutadapt version 3.5

while read line
do
	base=`echo $line | cut -f 1-3 -d "_"` 
	cutadapt \
	--cores=10 \
	-U 15 \
	-u 15 \
	-a CTGTCTCTTATA \
	-A CTGTCTCTTATA \
	-o $base"_R1_001_trimmed.fastq.gz" \
        -p $base"_R2_001_trimmed.fastq.gz" \
	$base"_R1_001.fastq.gz" \
	$base"_R2_001.fastq.gz" \
	> $base"_R1_R2_cutadapt.log"
done
