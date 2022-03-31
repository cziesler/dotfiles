#!/usr/bin/perl -w

use warnings;
use strict;

my $filename = shift;

#die "Oops! A file called '$filename' already exists.\n"
#      if -e $filename;
#
#use constant CONFIG => "config.txt";
#warn "Config file is looking pretty old!\n"
#      if -M CONFIG > 28;

#my @original_files = qw/ fred barney betty wilma pebbles dino bamm-bamm /;
#my @big_old_files; # The ones we want to put on backup tapes
#foreach my $filename (@original_files) {
#  push @big_old_files, $filename
#         if -s $filename > 100_000 and -A $filename > 90;
#}
#use Data::Dumper;
#print Dumper \@big_old_files;

use Data::Dumper;
my @arr = stat($filename);
print "@arr\n";

my $date = localtime $arr[8];
print "DATE: $date\n";
