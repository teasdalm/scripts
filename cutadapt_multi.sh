#! /usr/bin/env bash

while read line
do
	base=${line%.*.*}
	full=$base"_cutadapt.fastq.gz"
	cutadapt \
	--cores=10 \
	--overlap=1 \
	--minimum-length=30 \
	--adapter=AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC \
	--output=$full $line
done
