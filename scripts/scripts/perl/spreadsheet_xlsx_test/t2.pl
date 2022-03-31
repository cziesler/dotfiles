#!/usr/bin/perl
use strict;
use warnings;

use Spreadsheet::ParseExcel;

# Open spreadsheet
my $parser = Spreadsheet::ParseExcel->new();
my $excel  = $parser->parse("file.xls");

# Go through each sheet
foreach my $sheet ($excel->worksheets()) {
  printf "Sheet: $sheet->{Name}\n";

  # Go through each cell
  foreach my $row ($sheet->{MinRow} .. $sheet->{MaxRow}) {
    foreach my $col ($sheet->{MinCol} .. $sheet->{MaxCol}) {
      my $cell = $sheet->get_cell($row, $col);
      my $val = ($cell) ? $cell->value() : "";
      print "[$val] ";
    }
    print "\n";
  }
}
