#!/usr/bin/perl -w
#-------------------------------------------------------------------------------
# Filename: add_header.pl
# Author:   Cody Cziesler
# Date:     Wed Aug 22 13:09:11 PDT 2018
#-------------------------------------------------------------------------------

use strict;

die "usage: add_header.pl <name>" if (scalar(@ARGV) != 1);

my $author = "Cody Cziesler";
my $date = `date`; chomp $date;
my $file = $ARGV[0];
my ($ext) = ($file =~ /\.([^.]+)$/);
$ext ||= "";

my $comments = {
  "c"     => "//",
  "cpp"   => "//",
  "v"     => "//",
  "sv"    => "//",
  "pl"    => "#",
  "t"     => "#",
  "pm"    => "#",
  "py"    => "#",
  "csh"   => "#",
  "tcsh"  => "#",
  "bash"  => "#",
  "rb"    => "#",
  "m"     => "%",
  "vim"   => '"',
  "vimrc" => '"',
};

my $shebang = {
  "pl"   => get_shebang("perl")   . " -w\n",
  "t"    => get_shebang("perl")   . " -w\n",
  "pm"   => get_shebang("perl")   . " -w\n",
  "py"   => get_shebang("python") . "\n",
  "csh"  => get_shebang("csh")    . " -f\n",
  "tcsh" => get_shebang("tcsh")   . " -f\n",
  "rb"   => get_shebang("ruby")   . " -w\n",
};

# Create header
my $c = $comments->{$ext} || "//";
my $h = $shebang->{$ext} || "";

$h .= "$c" . '=' x (80-length($c)) . "\n";
$h .= "$c Filename:    $file\n";
$h .= "$c Author:      $author\n";
$h .= "$c Date:        $date\n";
$h .= "$c Description: \n";
$h .= "$c" . '=' x (80-length($c)) . "\n";
$h .= "\n";

# Capture input lines
my @input_lines;
if (-e $file) {
  open (my $fh_in, "<", $file) or die "Couldn't open [$file]";
  @input_lines = <$fh_in>;
  close $fh_in;
}

# Write output file with header
open (my $fh_out, ">", $file);

print $fh_out $h;
foreach (@input_lines) {
  print $fh_out $_;
}

close $fh_out;

# Gets the shebang for a given program
# NOTE: no error checking...
sub get_shebang {
  my $prg = shift;
  my $ret = "#!" . `which $prg`;
  chomp $ret;
  return $ret;
}
