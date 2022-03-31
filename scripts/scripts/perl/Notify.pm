package Notify;

use strict;
use warnings;

use Exporter qw(import);;

our @EXPORT_OK = qw(notify);

sub notify {
  my ($title, $message) = @_;
  my $cmd =
    qq/osascript -e 'display notification "$message" with title "$title"'/;
  system($cmd);
}

1;
