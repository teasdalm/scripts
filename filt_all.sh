#! /usr/bin/env bash
# Matthew Teasdale
# Filter BAM files 
# Cambridge, UK

# Globals
BAM_FILE=$1
BASE=${BAM_FILE%.*}
OPT=$2

# sort
samtools sort -@ 20  -O bam -o $BASE"_sort.bam" $BAM_FILE

# rmdup gatk style
gatk MarkDuplicates \
	-I $BASE"_sort.bam" \
	-O $BASE"_sort_dedup.bam" \
	-M $BASE"_sort_dedup_metrics.txt" \
	--REMOVE_DUPLICATES=true \
	--OPTICAL_DUPLICATE_PIXEL_DISTANCE=$OPT \
	--CREATE_INDEX=true \
	--VALIDATION_STRINGENCY=LENIENT



