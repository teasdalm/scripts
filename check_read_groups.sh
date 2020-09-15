#! /usr/bin/env bash
# Matthew Teasdale
# Cambridge 2020

BAM=$1

READ_GROUP=`samtools view -H $BAM | grep "^@RG"`

echo $BAM $READ_GROUP


