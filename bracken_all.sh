#! /usr/bin/env bash
# bracken_all_pe.sh

# Matthew Teasdale
# Newcastle BSU 2023

# Versions tested with
# Bracken version 2.8

# set globals
KRAKEN2_DB=$1
KRAKEN_FILE=$2
THREADS=$3
READ_LENGTH=$4
TAX_LEVEL=$5

BASE=${KRAKEN_FILE%.k22report}

# Run Bracken
echo "Running Braken for "$BASE
bracken -d $KRAKEN2_DB  \
	-i $KRAKEN_FILE	\
	-r $READ_LENGTH \
	-l $TAX_LEVEL \
	-t $THREADS \
	-o $BASE"."$TAX_LEVEL"."$READ_LENGTH".bracken" \
	-w $BASE"."$TAX_LEVEL"."$READ_LENGTH".breport" \
	> $BASE"."$TAX_LEVEL"."$READ_LENGTH".bracken.log"

