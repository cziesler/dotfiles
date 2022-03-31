#!/usr/bin/perl -w

use Getopt::Long;
use Term::Screen;
use File::Basename;

my $time = 1;
my $command = "";

# Get the time
my $getopt_res = GetOptions (
  "n|time=i"    => \$time,
);

# Get the command
foreach my $a (@ARGV) {
  if (defined($command)) {
    $command .= " " . $a;
  } else {
    $command = $a;
  }
}

my $scr = new Term::Screen;
my ($old_cols, $old_rows) = (-1, -1);
my @old_line;

my $heading = basename($0) . ": Hit any key to exit";

until ($scr->key_pressed()) {
  # Get current screen size;
  $scr->resize();
  my ($cols, $rows) = ($scr->cols(), $scr->rows());
  if ( ($cols != $old_cols) or ($rows != $old_rows) ) {
    $scr->clrscr();
    for (my $j = 1; $j < $rows; $j++) {
      $old_line[$j] = "";
    }
    ($old_cols, $old_rows) = ($cols, $rows);
  }

  $scr->at(0,0)->clreol()->puts(substr($heading, 0, $cols-17));
  my $t = localtime(time);
  $scr->at(0, $cols-length($t))->puts($t);

  $heading = "Every " . $time . "s: " . $command;

  my @result = `$command`;
  for (my $j = 1; $j < $rows; $j++) {
    my $line = "";
    if (defined($result[$j-1])) {
      $line = substr($result[$j-1], 0, $cols);
      chomp $line;
    }
    if (defined($old_line[$j]) and ($old_line[$j] ne $line)) {
      $scr->at($j,0)->clreol()->puts($line);
      $old_line[$j] = $line;
    }
  }

  sleep($time);
}

### Do the loop
##while () {
##  print `clear`;
##  print `date`;
##  print '-' x 80 . "\n";
##  print `$command`;
##  sleep($time);
##}
