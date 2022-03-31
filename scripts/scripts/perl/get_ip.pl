#!/usr/bin/perl -w

################################################################################
# Filename:    get_ip.pl
# Author:      Cody Cziesler
# Description: Gets the IP Address based on SAMBA name
#
# Usage:       get_ip.pl <NAME>
################################################################################

use strict;
use warnings;

# Die if we don't have enough arguments
die "Usage: get_ip.pl <NAME>\n" if (@ARGV != 1);

# Get the IP based on the name
my $ret = `smbutil lookup $ARGV[0] | grep "Got response from"`;

# regex to get the IP
$ret =~ s/Got response from //;

# Return the IP Address
print $ret;

