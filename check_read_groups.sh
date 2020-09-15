#! /usr/bin/env bash

BAM=$1

READ_GROUP=`samtools view -H $BAM | grep "^@RG"`

echo $BAM $READ_GROUP


