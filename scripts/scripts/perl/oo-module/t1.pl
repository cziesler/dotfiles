#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

# For Perl 5.26+, the cwd is not in the @INC search path.
use FindBin qw($RealBin);
use lib $RealBin;
use OO_cody;

{
  my $oo = OO_cody->new();
  print Dumper $oo;
}
{
  my $oo = OO_cody->new(
    quiet => 1,
  );
  print Dumper $oo;
}
{
  my $oo = OO_cody->new(
    quiet => 1,
    bleh => "cody",
    stuff => [1,2,3],
  );
  print Dumper $oo;

  use Scalar::Util 'blessed';
  print blessed($oo) . "\n";
}
