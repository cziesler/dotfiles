#!/usr/bin/perl

use Image::EXIF;
use Data::Dumper;
$Data::Dumper::Indent = 1;

my $exif = new Image::EXIF($ARGV[0]);

print $exif->error ? $exif->errstr : Dumper($exif->get_all_info());
