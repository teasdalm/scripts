#! /usr/bin/env bash
# Matthew Teasdale
# Cambridge 2020

bam=$1

count=$(samtools flagstat $bam | grep "mapped (" | cut -f 1 -d " " )

printf "%s\t%s\n" "$bam" "$count"

