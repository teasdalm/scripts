#! /usr/bin/env bash
# Matthew Teasdale
# Cambridge 2020

fastq_file=$1

reads=`bioawk -c fastx 'END{print NR}' $1`

printf "%s\t%s\n" "$fastq_file" "$reads"

