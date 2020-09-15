#! /usr/bin/env perl 
# Matthew Teasdale
# Cambridge 2020

use warnings;
use strict;
use 5.22.0;

# hash to store depth data
my %depth;

while (<<>>){
	chomp;
	my $length_of_seq = length((split /\t/)[9]);
	$depth{$length_of_seq}++;
}


# print header 
print "#Length\tn\n";

# print nice output table
# sort numerically ascendingly
foreach my $count (sort {$a <=> $b} keys %depth) {  
	print "$count\t$depth{$count}\n";
}
