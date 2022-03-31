package OO_cody;

use strict;
use warnings;

sub new {
  my ($class, %args) = @_;

  return bless {
    quiet => exists $args{quiet} ? $args{quiet} : "",
    debug => exists $args{debug} ? $args{debug} : "",
    stuff => exists $args{stuff} ? $args{stuff} : [],
    dict  => exists $args{dict}  ? $args{dict}  : {},
  }, $class;
}

1;
