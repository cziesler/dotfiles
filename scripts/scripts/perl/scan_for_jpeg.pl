#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
$Data::Dumper::Indent = 1;


my @jpeg_start_code = qw/
  FF
  D8
  FF
  E1
  D1
  B1
  45
  78
  69
  66
  00
  00
  49
  49
  2A
  00/;


my $file = $ARGV[0];

# Open the file, then set binary mode on
open (INFILE, "$file") or die "Couldn't open [$file]: $!";
binmode INFILE;

my ($data, $n);

$data = 0;
$n = 0;

my @bytes;

while (($n = read(INFILE, $data, 1)) != 0) {
  my $bytes = "";
  foreach (split(//, $data)) {
    push(@bytes, sprintf("%02X", ord($_)));
  }
}

close INFILE;

START_LOOP: foreach my $i (0 .. scalar(@bytes) - 1 - scalar(@jpeg_start_code)) {
  foreach my $j (0 .. scalar(@jpeg_start_code) - 1) {
    last START_LOOP if ($bytes[$i+$j] ne $jpeg_start_code[$j]);
  }
  print "Found potential SOF @ $i\n";
}
