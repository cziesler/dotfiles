#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;
my $verbose = 0;
my $quiet = 0;
my $opt = "";
my @colors = ();
GetOptions (
  "v|verbose" => \$verbose,
  "q|quiet"   => \$quiet,
  "opt=s"     => \$opt,
  "color=s"   => \@colors,
);
print "v:$verbose, q:$quiet, opt:$opt, color:@colors\n";
