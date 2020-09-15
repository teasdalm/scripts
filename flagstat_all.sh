#! /usr/bin/env bash
bam=$1

count=$(samtools flagstat $bam | grep "mapped (" | cut -f 1 -d " " )

printf "%s\t%s\n" "$bam" "$count"

