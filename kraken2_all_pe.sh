#! /usr/bin/env bash
# kraken2_all_pe.sh

# Matthew Teasdale
# Newcastle BSU 2023

# Versions tested with
# Kraken version 2.1.3
# Bracken version 2.8

# set globals
KRAKEN2_DB=$1
FASTQ_FILE=$2
THREADS=$3

base=`echo $FASTQ_FILE | cut -f 1-3 -d "_"`

# Run Kraken2
echo "Running Kraken2 for "$base
kraken2 \
	--db $KRAKEN2_DB \
	--threads $THREADS \
	--report $base".k2report" \
	--report-minimizer-data \
	--minimum-hit-groups 3 \
	--paired $base"_nonhuman_reads.fastq.1.gz" $base"_nonhuman_reads.fastq.2.gz" \
 	> $base".kraken2" \
	2> $base".kraken2.log"

# Run Bracken
echo "Running Braken for "$base
bracken -d $KRAKEN2_DB  \
	-i $base".k2report" \
	-r 100 \
	-l S \
	-t $THREADS \
	-o $base".100.bracken" \
	-w $base".100.breport" \
	> $base".100.bracken.log"

