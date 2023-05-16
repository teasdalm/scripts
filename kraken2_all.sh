#! /usr/bin/env bash

# bowtie2_host.sh
# Matthew Teasdale
# Cambridge 2023

# set globals
KRAKEN2_DB=$1
FASTQ_FILE=$2
SHORT_NAME=${FASTQ_FILE%.*.*}
THREADS=$3
READ_LEN=$4


# Run Kraken2
echo "Running Kraken2 for "$FASTQ_FILE
kraken2 --db $KRAKEN2_DB \
	--threads $THREADS \
	--report $SHORT_NAME".k2report" \
	--report-minimizer-data \
	--minimum-hit-groups 3 \
	$FASTQ_FILE > $SHORT_NAME".kraken2" \
	2> $SHORT_NAME".kraken2.log"

# Run Bracken
echo "Running Braken for "$FASTQ_FILE
bracken -d $KRAKEN2_DB  \
	-i $SHORT_NAME".k2report" \
	-r $READ_LEN \
	-l S \
	-t $THREADS \
	-o $SHORT_NAME"."$READ_LEN".bracken" \
	-w $SHORT_NAME"."$READ_LEN".breport" \
	> $SHORT_NAME"."$READ_LEN".bracken.log"

# Make krona
echo "Make krona for "$FASTQ_FILE
python3 ~/install/KrakenTools-1.2/kreport2krona.py -r  $SHORT_NAME"."$READ_LEN".breport"  -o $SHORT_NAME"."$READ_LEN".b.krona.txt"
ktImportText $SHORT_NAME"."$READ_LEN".b.krona.txt" -o $SHORT_NAME"."$READ_LEN".b.krona.html"

