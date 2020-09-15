#! /usr/bin/env perl 
# Matthew Teasdale
# Cambridge 2020

use warnings;
use strict;

my $max_depth = $ARGV[0];

while (<STDIN>){
	chomp;
	my ($chr,$pos, $depth) = split /\t/;
	if( $depth >= $max_depth -10){
		# bed file 0 based so -1 for first position
		my $start_bed_pos = $pos-100;
		my $end_bed_pos = $pos+100;

		print "$chr\t$start_bed_pos\t$end_bed_pos\t$pos\tdepth=$depth\n";
	}
}


