#! /usr/bin/perl
# Matthew Teasdale
# Cambridge 2020

use warnings;
use strict;

# get command line arguments
my ($sample, $genome_size) = @ARGV;

# total array for final count
my @total=(0)x$sample;

# take inpu from standard in
while (<STDIN>){
	chomp;
	my @record = split(/\t/, $_);
	for my $i (2 .. $#record){
		$total[$i-2] = $total[$i-2] + $record[$i];
	}                        
}

# devide total by genome size
foreach my $x (@total) { 
	$x = $x / $genome_size;
}

# print output
print join("\t", @total);
print "\n";
