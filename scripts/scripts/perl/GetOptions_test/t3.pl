#!/usr/bin/perl
use warnings;
use strict;
use Getopt::Long;
my $self;
GetOptions (
  "v|verbose" => \($self->{verbose} = 0),
  "q|quiet"   => \($self->{quiet} = 0),
  "opt=s"     => \($self->{opt} = ""),
  "color=s@"  => \@{($self->{colors} = [])},
);
print "v:$self->{verbose}, q:$self->{quiet}, opt:$self->{opt}, color:@{$self->{colors}}\n";
