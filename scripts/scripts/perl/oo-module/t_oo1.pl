#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

# For Perl 5.26+, the cwd is not in the @INC search path.
use FindBin qw($RealBin);
use lib $RealBin;
use OO1;

my $oo1 = OO1->new();
print Dumper $oo1;

$oo1 = OO1->new(quiet => 1);
print Dumper $oo1;

