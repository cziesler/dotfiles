#!/usr/bin/perl

use strict;
use warnings;

use Notify qw(notify);

die if scalar @ARGV != 2;

notify(@ARGV);
