#!/usr/bin/perl

use Term::ANSIScreen qw(cls);
my $clear_screen = cls();

print "Some text\n";
print $clear_screen;
print "Some more text\n";

