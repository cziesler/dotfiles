#!/usr/bin/perl

use MP3::Info;
use Data::Dumper;

die "Usage: $0 file" if (!defined $ARGV[0]);
my $file = $ARGV[0];

my $tag = get_mp3tag($file) or die "No TAG Info";
my $info = get_mp3info($file) or die "No INFO Info";

print "TAG: " . Dumper $tag;
print "INFO: " . Dumper $info;
