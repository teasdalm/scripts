#! /usr/bin/env perl

##########################################
#
# align_all.pl 
# Align samples with bwa
#
##########################################

use strict;
use warnings;
use 5.26.0;

# get and check command line arguments
# genome - reference genome
# fastq - input fastq file 
# base_name - name of output files
# threads - threads needed for the alignment
if( @ARGV != 4 ){	
	die "# align_all.pl\n" .
	"# Wrong number of arguments\n" .
	"# usage ./align_all.pl genome.fa file.fastq base_name threads\n";
}	

my($genome, $fastq, $base_name, $threads) = @ARGV;

# check of arguments
#print "$genome\n$fastq\n$base_name\n$threads\n";

# aln command
my $aln_command = "bwa aln -l 1024 -t $threads $genome $fastq > $base_name.sai";
system($aln_command);

# samse command
my $samse_command = "bwa samse $genome $base_name.sai $fastq | samtools view -Sb - > $base_name.bam";
system($samse_command);

# clean up
print "removing sai file $base_name.sai\n";
system("rm $base_name.sai");

#print "$aln_command\n";
#print "$samse_command\n";

