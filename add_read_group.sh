#! /usr/bin/env bash

BAM_FILE=$1 # input bam name
GENOME=$2
BASE=${BAM_FILE%.*}
SAMPLE_NAME=$3 # sample name
LIB=$4 # library name
RUN=$5 # sequencing run
CENT=$6 # sequencing centre
BAR=$7 # run barcode

gatk AddOrReplaceReadGroups \
        --VALIDATION_STRINGENCY LENIENT \
        --INPUT $BAM_FILE \
        --OUTPUT $SAMPLE_NAME"_"$RUN"_"$GENOME"_sort_dedup_RG.bam" \
        --RGID $SAMPLE_NAME"_"$RUN"_"$CENT \
        --RGLB $LIB"_"$BAR \
        --RGPL ILLUMINA \
        --RGPU $LIB"_"$BAR"_"$RUN \
        --RGSM $SAMPLE_NAME \
        --RGCN $CENT \

