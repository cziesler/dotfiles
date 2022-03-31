#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;
GetOptions (
  "v|verbose" => \(my $verbose = 0),
  "q|quiet"   => \(my $quiet = 0),
  "opt=s"     => \(my $opt = ""),
  "color=s@"  => \(my $colors = []),
);
print "v:$verbose, q:$quiet, opt:$opt, color:@$colors\n";
